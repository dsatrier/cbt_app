import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test_drive/pages/second_page.dart';
import 'package:test_drive/pages/third_page.dart';
import 'package:test_drive/pages/fourth_page.dart';
import 'package:test_drive/pages/reflection_page.dart';
import 'package:test_drive/pages/stats_page.dart';
import 'package:test_drive/utils/content_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // Streak tracking variables
  int currentStreak = 0;
  int totalDaysCompleted = 0;
  String _userName = 'User';
  DateTime? lastCompletedDate;
  String? lastCheckDate;

  final Set<String> selectedOptions = {};
  List<String> options = [];
  String currentDayKey = '';
  bool isExpanded = false;
  int selectedWeek = 1;
  int selectedDay = 1;

  @override
  void initState() {
    super.initState();
    _loadStreakData();
  }

  Future<void> _loadStreakData() async {
    final prefs = await SharedPreferences.getInstance();

    currentStreak = prefs.getInt('currentStreak') ?? 0;
    totalDaysCompleted = prefs.getInt('totalDaysCompleted') ?? 0;
    lastCheckDate = prefs.getString('lastCheckDate');
    _userName = prefs.getString('userName') ?? 'User';

    final lastDateString = prefs.getString('lastCompletedDate');
    if (lastDateString != null) {
      lastCompletedDate = DateTime.parse(lastDateString);
    }

    // 2. Check for new day and clear tasks (must happen BEFORE content is set)
    await _checkAndResetForNewDay(prefs);

    // 3. Advance streak and content if the previous day was finished
    await _advanceStreakOnNewDay(prefs);
    
    // 4. Update the UI based on final loaded state
    setState(() {
      _setTodaysContent();
      _checkStreakValidity();
    });
  }

  // Stores completion flag and resets tasks for the new day
  Future<void> _checkAndResetForNewDay(SharedPreferences prefs) async {
    final today = _getTodayDateString();
    
    if (lastCheckDate != today) {
      // New day detected. Check if the previous day's tasks were completed.
      // The previous "current" day number is totalDaysCompleted + 1
      final prevDayNumber = totalDaysCompleted + 1;
      final prevKey = prevDayNumber.toString();
      final savedOptions = prefs.getStringList('selectedOptions_' + prevKey) ?? [];
      final wasCompleted = prefs.getBool(_prefsCompletedKey(prevKey)) ?? (savedOptions.length == 3);
      
      // Store the completion status temporarily for _advanceStreakOnNewDay
      await prefs.setBool('wasPreviousDayCompleted', wasCompleted);
      
      // Reset in-memory tasks for the new (selected) day; actual per-day saved data remains in prefs
      selectedOptions.clear();
      lastCheckDate = today;
      await prefs.setString('lastCheckDate', today);
      // leave per-day stored selectedOptions_<day> entries intact; we only remove the global old key if present
      await prefs.remove('selectedOptions');
      
    } else {
      // Same day, load previous progress
      // We'll load the per-day selected options later once currentDayKey has been set
      // (no-op here)
      // Ensure the temporary flag is clear if it's not a new day
      await prefs.remove('wasPreviousDayCompleted');
    }
  }

  String _prefsSelectedOptionsKey(String dayKey) => 'selectedOptions_' + dayKey;
  String _prefsCompletedKey(String dayKey) => 'completed_' + dayKey;

  // Checks the flag and advances streak/content only on a new day
  Future<void> _advanceStreakOnNewDay(SharedPreferences prefs) async {
    final wasCompleted = prefs.getBool('wasPreviousDayCompleted') ?? false;
    
    if (wasCompleted) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      
      // Check if the completion date is *before* today (ensures single advancement)
      if (lastCompletedDate != null && 
          DateTime(lastCompletedDate!.year, lastCompletedDate!.month, lastCompletedDate!.day)
              .isBefore(today)) {
        
        // This advances the streak and content
        currentStreak++;
        totalDaysCompleted++;
        lastCompletedDate = now; // Mark today as the new completion date
        
        await _saveStreakData(prefs);
      }
    }
    // Always remove the flag after checking
    await prefs.remove('wasPreviousDayCompleted');
  }

  String _getTodayDateString() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  // Sets the Reading and Assessment content based on the total days completed
  void _setTodaysContent() {
    // Calculate which week and day we're on
    final week = (totalDaysCompleted ~/ 7) + 1;
    final dayInWeek = (totalDaysCompleted % 7) + 1;
    
    selectedWeek = week;
    selectedDay = dayInWeek;
    
    // Get content from ContentData
    final weekContent = ContentData.getWeekContent(week);
    if (weekContent.isNotEmpty && dayInWeek <= weekContent.length) {
      final todayContent = weekContent[dayInWeek - 1];
      currentDayKey = todayContent["day"]!;
      
      options = [
        "Read: ${todayContent["reading"]!}",
        todayContent["assessment"]!,
        "Reflection Tracker",
      ];
      // Load saved selections for this specific day
      _loadSelectedOptionsForCurrentDay();
    }
  }

  void _checkStreakValidity() {
    if (lastCompletedDate != null) {
      final now = DateTime.now();
      final lastDate = DateTime(
        lastCompletedDate!.year,
        lastCompletedDate!.month,
        lastCompletedDate!.day,
      );
      final today = DateTime(now.year, now.month, now.day);
      final daysDifference = today.difference(lastDate).inDays;
      
      if (daysDifference > 1) {
        _resetStreak();
      }
    }
  }

  Future<void> _resetStreak() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      currentStreak = 0;
    });
    
    await prefs.setInt('currentStreak', 0);
    await prefs.remove('lastCompletedDate');
  }

  // Saves the current state of variables to SharedPreferences
  Future<void> _saveStreakData([SharedPreferences? prefsInstance]) async {
    final prefs = prefsInstance ?? await SharedPreferences.getInstance();
    await prefs.setInt('currentStreak', currentStreak);
    await prefs.setInt('totalDaysCompleted', totalDaysCompleted);
    // Save selected options per-day (keyed by currentDayKey)
    if (currentDayKey.isNotEmpty) {
      await prefs.setStringList(_prefsSelectedOptionsKey(currentDayKey), selectedOptions.toList());
    }
    
    if (lastCompletedDate != null) {
      await prefs.setString('lastCompletedDate', lastCompletedDate!.toIso8601String());
    }
    
    if (lastCheckDate != null) {
      await prefs.setString('lastCheckDate', lastCheckDate!);
    }
  }

  // Load per-day selected options into memory for the currentDayKey
  Future<void> _loadSelectedOptionsForCurrentDay() async {
    if (currentDayKey.isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_prefsSelectedOptionsKey(currentDayKey)) ?? [];
    setState(() {
      selectedOptions.clear();
      selectedOptions.addAll(saved);
    });
  }

  void _showCompletionDialog() {
    final isWeekComplete = currentStreak % 7 == 0;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          isWeekComplete ? '🎉 Week Complete!' : '✅ Day Complete!',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          isWeekComplete 
              ? 'Amazing! You\'ve completed Week ${currentStreak ~/ 7}! The content will update tomorrow.'
              : 'Great job! You\'ve completed today\'s tasks. Current streak: $currentStreak days! Check back tomorrow for the next set.',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Continue', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  Widget _buildStreakIndicator() {
    final streakInCurrentWeek = currentStreak % 7;
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        final isCompleted = index < streakInCurrentWeek;
        
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isCompleted ? const Color(0xFF93679D) : Colors.grey[300],
              border: Border.all(
                color: isCompleted ? const Color(0xFF93679D) : Colors.grey[400]!,
                width: 2,
              ),
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : Text(
                      '${index + 1}',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final verticalSpacing = screenHeight * 0.05;
    const horizontalPadding = 20.0;

    // Calculate overall program progress (days completed out of total days)
    final totalDaysInProgram = ContentData.getTotalDays();
    // Include fractional progress for the current day's completed tasks so the ring
    // advances as the user checks off today's plan items.
    final dayFraction = options.isEmpty ? 0.0 : (selectedOptions.length / options.length);
    double progressPercent = totalDaysInProgram == 0
      ? 0.0
      : (totalDaysCompleted + dayFraction) / totalDaysInProgram;
    if (progressPercent > 1.0) progressPercent = 1.0;
    
    // Use totalDaysCompleted for correct content tracking
    final currentWeek = (totalDaysCompleted ~/ 7) + 1; 
    final currentDay = (totalDaysCompleted % 7) + 1;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SizedBox(height: verticalSpacing),

              // HEADER: Hello + Progress + Dropdowns
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEAE2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Hello $_userName!",
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context).textTheme.headlineLarge,
                                  ),
                                ),
                                Text(
                                  "Week $currentWeek • Day $currentDay",
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: Colors.grey[700]),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Everyday you show up counts.",
                                  style: GoogleFonts.poppins(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: Colors.grey[600]),
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),
                          CircularPercentIndicator(
                            radius: 70.0,
                            lineWidth: 10.0,
                            percent: progressPercent,
                            animation: true,
                            animationDuration: 1200,
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: const Color(0xFF93679D),
                            backgroundColor: const Color(0xFFDFDFDF),
                            center: Text(
                              "${(progressPercent * 100).toInt()}%",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Week / Day selector dropdowns
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: selectedWeek,
                                underline: const SizedBox.shrink(),
                                items: List.generate(7, (i) => i + 1)
                                    .map((w) => DropdownMenuItem(value: w, child: Text('Week $w', style: GoogleFonts.poppins())))
                                    .toList(),
                                onChanged: (val) async {
                                  if (val == null) return;
                                  setState(() {
                                    selectedWeek = val;
                                    selectedDay = selectedDay.clamp(1, 7);
                                    totalDaysCompleted = (selectedWeek - 1) * 7 + (selectedDay - 1);
                                    _setTodaysContent();
                                  });
                                  final prefs = await SharedPreferences.getInstance();
                                  await _saveStreakData(prefs);
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButton<int>(
                                isExpanded: true,
                                value: selectedDay,
                                underline: const SizedBox.shrink(),
                                items: List.generate(7, (i) => i + 1)
                                    .map((d) => DropdownMenuItem(value: d, child: Text('Day $d', style: GoogleFonts.poppins())))
                                    .toList(),
                                onChanged: (val) async {
                                  if (val == null) return;
                                  setState(() {
                                    selectedDay = val;
                                    totalDaysCompleted = (selectedWeek - 1) * 7 + (selectedDay - 1);
                                    _setTodaysContent();
                                  });
                                  final prefs = await SharedPreferences.getInstance();
                                  await _saveStreakData(prefs);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: verticalSpacing * 0.6),

              // Streak indicator
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        '${currentStreak} Day Streak 🔥',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF93679D),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildStreakIndicator(),
                    ],
                  ),
                ),
              ),

              SizedBox(height: verticalSpacing),

              // SECTION 1: Today's Plan
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Today's Plan",
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      ContentData.getWeekTitle(selectedWeek),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 12),

              // Tiny Habits card

              SizedBox(height: 12),

              // Tiny Habits card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA995AE),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${selectedOptions.length}/${options.length}",
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .labelLarge
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                ContentData.getWeekTitle(selectedWeek),
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                          color: const Color(0xFF543B5B),
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Image.asset(
                              "/home/aadi/Desktop/tp/test_drive/lib/assets/alarm.png",
                              width: 70,
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                      if (isExpanded)
                        Column(
                          children: options.asMap().entries.map((entry) {
                            int index = entry.key;
                            String option = entry.value;

                            return CheckboxListTile(
                              title: Text(
                                option,
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                              value: selectedOptions.contains(option),
                              onChanged: (bool? checked) async {
                                final prefs = await SharedPreferences.getInstance();
                                if (checked == false) {
                                  setState(() {
                                    selectedOptions.remove(option);
                                  });
                                  // Save per-day selections and clear completed flag for this day
                                  if (currentDayKey.isNotEmpty) {
                                    await prefs.setStringList(_prefsSelectedOptionsKey(currentDayKey), selectedOptions.toList());
                                    await prefs.setBool(_prefsCompletedKey(currentDayKey), false);
                                  }
                                  return;
                                }

                                Widget? destinationPage;

                                switch (index) {
                                  case 0: // Reading material (changes daily)
                                    final todayContent = ContentData.getContentForDay(totalDaysCompleted + 1);
                                    if (todayContent != null) {
                                      destinationPage = SecondPage(
                                        dayNumber: currentDayKey,
                                        title: todayContent["reading"] ?? 'Reading Material',
                                      );
                                    }
                                    break;
                                  case 1: // Assessment (changes daily)
                                    final todayContent = ContentData.getContentForDay(totalDaysCompleted + 1);
                                    if (todayContent != null) {
                                      destinationPage = ThirdPage(
                                        dayNumber: currentDayKey,
                                        title: todayContent["assessment"] ?? 'Assessment',
                                      );
                                    }
                                    break;
                                  case 2: // Reflection Tracker (stays same)
                                    destinationPage = const ReflectionPage();
                                    break;
                                }

                                if (destinationPage != null) {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => destinationPage!,
                                    ),
                                  );

                                  setState(() {
                                    selectedOptions.add(option);
                                  });

                                  // Save per-day selections
                                  if (currentDayKey.isNotEmpty) {
                                    await prefs.setStringList(_prefsSelectedOptionsKey(currentDayKey), selectedOptions.toList());
                                  }

                                  // If all tasks for this day are completed, and we haven't shown completion yet, show it and mark completed
                                  if (selectedOptions.length == options.length && currentDayKey.isNotEmpty) {
                                    final alreadyCompleted = prefs.getBool(_prefsCompletedKey(currentDayKey)) ?? false;
                                    if (!alreadyCompleted) {
                                      await prefs.setBool(_prefsCompletedKey(currentDayKey), true);
                                      // show the completion dialog (does not advance streak here; that still happens on new day rollover)
                                      _showCompletionDialog();
                                    }
                                  }
                                }
                              },
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: verticalSpacing),

              // SECTION 2: Sleep Stats
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Text(
                  "Sleep Stats",
                  style: GoogleFonts.poppins(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),

              SizedBox(height: 12),

              // Log Sleep Diary card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: InkWell( 
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FourthPage(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA995AE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Log Sleep Diary",
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Log your sleep.",
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Image.asset(
                          "/home/aadi/Desktop/tp/test_drive/lib/assets/sleep.jpg",
                          width: 70,
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 12),

              // Sleep Analytics card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StatsPage(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA995AE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sleep Analytics",
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "View your sleep trends.",
                                style: GoogleFonts.poppins(
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.show_chart, color: Colors.white, size: 70),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: verticalSpacing),
            ],
          ),
        ),
      ),
    );
  }
}