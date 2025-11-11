import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:test_drive/pages/second_page.dart';
import 'package:test_drive/pages/third_page.dart';
import 'package:test_drive/pages/fourth_page.dart';
import 'package:test_drive/pages/reflection_page.dart';
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
  
  // Different content for each day (35 days of content - 5 weeks)
  final List<Map<String, String>> dailyContent = [
    // Week 1
    {"reading": "5 Tips to Improve Sleep", "assessment": "Sleep Quality Assessment", "day": "1"},
    {"reading": "Understanding Sleep Cycles", "assessment": "Bedtime Routine Check", "day": "2"},
    {"reading": "Creating a Sleep Environment", "assessment": "Bedroom Assessment", "day": "3"},
    {"reading": "Managing Screen Time", "assessment": "Technology Usage Review", "day": "4"},
    {"reading": "Relaxation Techniques", "assessment": "Stress Level Check", "day": "5"},
    {"reading": "Diet and Sleep Connection", "assessment": "Nutrition Assessment", "day": "6"},
    {"reading": "Exercise for Better Sleep", "assessment": "Activity Level Review", "day": "7"},
    
    // Week 2
    {"reading": "Sleep Hygiene Fundamentals", "assessment": "Morning Energy Assessment", "day": "8"},
    {"reading": "The Power of Consistency", "assessment": "Schedule Consistency Check", "day": "9"},
    {"reading": "Dealing with Insomnia", "assessment": "Sleep Latency Assessment", "day": "10"},
    {"reading": "Napping Strategies", "assessment": "Daytime Fatigue Review", "day": "11"},
    {"reading": "Caffeine and Sleep", "assessment": "Caffeine Intake Assessment", "day": "12"},
    {"reading": "Temperature and Sleep", "assessment": "Sleep Environment Check", "day": "13"},
    {"reading": "Wind-Down Routines", "assessment": "Evening Habits Review", "day": "14"},
    
    // Week 3
    {"reading": "Managing Stress for Sleep", "assessment": "Stress Management Check", "day": "15"},
    {"reading": "Meditation Basics", "assessment": "Mindfulness Practice Review", "day": "16"},
    {"reading": "Progressive Muscle Relaxation", "assessment": "Relaxation Progress Check", "day": "17"},
    {"reading": "Breathing Exercises", "assessment": "Breathing Practice Assessment", "day": "18"},
    {"reading": "Sleep Disorders Overview", "assessment": "Sleep Pattern Analysis", "day": "19"},
    {"reading": "When to Seek Help", "assessment": "Sleep Health Evaluation", "day": "20"},
    {"reading": "Building Better Habits", "assessment": "Habit Formation Check", "day": "21"},
    
    // Week 4
    {"reading": "Advanced Sleep Strategies", "assessment": "Weekly Progress Assessment", "day": "22"},
    {"reading": "Cognitive Techniques", "assessment": "Mental Health Check", "day": "23"},
    {"reading": "Sleep and Productivity", "assessment": "Performance Review", "day": "24"},
    {"reading": "Social Life and Sleep", "assessment": "Lifestyle Balance Check", "day": "25"},
    {"reading": "Travel and Sleep", "assessment": "Adaptability Assessment", "day": "26"},
    {"reading": "Seasonal Changes", "assessment": "Environmental Factors Review", "day": "27"},
    {"reading": "Long-term Maintenance", "assessment": "Sustainability Check", "day": "28"},
    
    // Week 5
    {"reading": "Long-term Sleep Health", "assessment": "Comprehensive Review", "day": "29"},
    {"reading": "Sleep Across Lifespan", "assessment": "Life Stage Assessment", "day": "30"},
    {"reading": "Optimizing Recovery", "assessment": "Recovery Quality Check", "day": "31"},
    {"reading": "Sleep and Immunity", "assessment": "Health Impact Review", "day": "32"},
    {"reading": "Future Planning", "assessment": "Goal Setting Assessment", "day": "33"},
    {"reading": "Celebrating Progress", "assessment": "Achievement Review", "day": "34"},
    {"reading": "Continuing the Journey", "assessment": "Habit Consolidation Check", "day": "35"},
  ];

  late List<String> options;
  final Set<String> selectedOptions = {};
  bool isExpanded = false;
  String currentDayKey = "1";

  @override
  void initState() {
    super.initState();
    _loadStreakData(); 
  }

  Future<void> _loadStreakData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // 1. Load initial data
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
      final savedOptions = prefs.getStringList('selectedOptions') ?? [];
      final wasCompleted = savedOptions.length == 3;
      
      // Store the completion status temporarily for _advanceStreakOnNewDay
      await prefs.setBool('wasPreviousDayCompleted', wasCompleted);
      
      // Reset tasks for the new day
      selectedOptions.clear();
      lastCheckDate = today;
      await prefs.setString('lastCheckDate', today);
      await prefs.remove('selectedOptions'); // Crucial: removes the saved list
      
    } else {
      // Same day, load previous progress
      final savedOptions = prefs.getStringList('selectedOptions') ?? [];
      selectedOptions.addAll(savedOptions);
      // Ensure the temporary flag is clear if it's not a new day
      await prefs.remove('wasPreviousDayCompleted');
    }
  }

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
    final dayIndex = totalDaysCompleted % dailyContent.length;
    final todayContent = dailyContent[dayIndex];
    
    currentDayKey = todayContent["day"]!;
    
    options = [
      "Read: ${todayContent["reading"]!}",
      todayContent["assessment"]!,
      "Reflection Tracker",
    ];
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
    // Saves the current selectedOptions list (full if just completed, empty if advanced)
    await prefs.setStringList('selectedOptions', selectedOptions.toList()); 
    
    if (lastCompletedDate != null) {
      await prefs.setString('lastCompletedDate', lastCompletedDate!.toIso8601String());
    }
    
    if (lastCheckDate != null) {
      await prefs.setString('lastCheckDate', lastCheckDate!);
    }
  }

  // Only updates streak and completion date, does NOT advance content
  Future<void> _performStreakAdvancement() async {
      final prefs = await SharedPreferences.getInstance();

      // Only update local variables to be saved
      currentStreak++;
      totalDaysCompleted++;
      lastCompletedDate = DateTime.now();
      
      // Save the state (including the now-full selectedOptions)
      await _saveStreakData(prefs); 
      
      // Now update the UI to show 3/3 and the dialog
      setState(() {});
      _showCompletionDialog();
  }

  // Triggers advancement and saves completion flag
  void _checkDayCompletion() async {
    // Only proceed if all tasks are completed
    if (selectedOptions.length == options.length) {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      
      // Only run the advancement logic once per day
      if (lastCompletedDate == null || 
          DateTime(lastCompletedDate!.year, lastCompletedDate!.month, lastCompletedDate!.day)
              .isBefore(today)) {
        
        await _performStreakAdvancement(); 
      }
    }
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

    final progressPercent = options.isEmpty ? 0.0 : selectedOptions.length / options.length;
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEAE2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
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
                ),
              ),

              SizedBox(height: verticalSpacing * 0.6),

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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Today's Plan",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

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
                                "Tiny Habits",
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
                                if (checked == false) {
                                  setState(() {
                                    selectedOptions.remove(option);
                                  });
                                  await _saveStreakData();
                                  return;
                                }

                                Widget? destinationPage;

                                // Replace the switch statement section (around line 485-510) with this:

                                switch (index) {
                                  case 0: // Reading material (changes daily)
                                    final dayIndex = totalDaysCompleted % dailyContent.length;
                                    final todayContent = dailyContent[dayIndex];
                                    destinationPage = SecondPage(
                                      dayNumber: currentDayKey,
                                      title: todayContent["reading"]!,
                                    );
                                    break;
                                  case 1: // Assessment (changes daily)
                                    final dayIndex = totalDaysCompleted % dailyContent.length;
                                    final todayContent = dailyContent[dayIndex];
                                    destinationPage = ThirdPage(
                                      dayNumber: currentDayKey,
                                      title: todayContent["assessment"]!,
                                    );
                                    break;
                                  case 2: // Reflection Tracker (stays same)
                                    destinationPage = const ReflectionPage();  // Changed from ReflectionsTracker()
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
                                  
                                  await _saveStreakData();
                                  _checkDayCompletion(); 
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                // WRAPPING THE ENTIRE CARD WITH INKWELL
                child: InkWell( 
                  onTap: () {
                    // Navigate to the FourthPage when the card is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FourthPage(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20), // Match container's border radius
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
            ],
          ),
        ),
      ),
    );
  }
}