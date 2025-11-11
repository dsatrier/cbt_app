import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  // --- Styling Constants ---
  static const Color primaryColor = Color(0xFF93679D);
  static const Color accentColor = Color(0xFFA995AE);
  static const Color backgroundColor = Color(0xFFEBEAE2);
  static const String prefsKey = 'sleepDiaryEntries';
  static const String lastLogDateKey = 'lastLogDate';

  // --- State Variables ---
  int currentStep = 0;
  List<String> questions = [
    "What time did you go to bed? (e.g., 10:30 PM)", // Step 0: Time Picker
    "How long did it take you to fall asleep? (Latency in minutes)",
    "What time did you wake up?", // Step 2: Time Picker
    "How many times did you wake up during the night?",
    "How would you rate your sleep quality? (1=Poor, 5=Excellent)",
    "Did you consume caffeine or alcohol within 4 hours of bedtime? (Yes/No)",
    "Describe any significant dreams or reflections."
  ];
  List<String> answers = List.filled(7, "");
  List<Map<String, String>> diaryEntries = [];
  bool isLoading = true;
  // NEW: State variable to enforce the one-entry-per-day rule
  bool hasLoggedToday = false; 

  // --- Controllers ---
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_updateButtonState); 
    _loadDiaryEntries();
  }

  @override
  void dispose() {
    _controller.removeListener(_updateButtonState);
    _controller.dispose();
    super.dispose();
  }
  
  void _updateButtonState() {
    if (mounted) { 
      setState(() {});
    }
  }

  // --- Time Picker Method ---
  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          // Apply app's theme colors to the picker
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              onPrimary: Colors.white,
              onSurface: primaryColor,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      // Format the time nicely for display and storage (e.g., 10:30 PM)
      String formattedTime = picked.format(context);
      
      setState(() {
        _controller.text = formattedTime;
        answers[currentStep] = formattedTime; // Immediately store the answer
      });
    }
  }

  // --- Utility Method ---
  String _getTodayDateString() {
    return DateTime.now().toIso8601String().substring(0, 10);
  }

  // --- Persistence Methods ---
  Future<void> _loadDiaryEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final String? entriesString = prefs.getString(prefsKey);
    final String? lastLogDate = prefs.getString(lastLogDateKey);
    
    final List<Map<String, String>> tempEntries = [];

    if (entriesString != null) {
      final List<dynamic> decodedList = jsonDecode(entriesString);
      
      for (var entry in decodedList) {
        final Map<String, dynamic> dynamicMap = entry as Map<String, dynamic>;
        
        final Map<String, String> stringMap = {};
        dynamicMap.forEach((key, value) {
          stringMap[key] = value.toString();
        });
        tempEntries.add(stringMap);
      }
    }

    setState(() {
      diaryEntries = tempEntries;
      // Check if the last log date matches today's date
      hasLoggedToday = lastLogDate == _getTodayDateString();
      isLoading = false;
    });
  }

  Future<void> _saveDiaryEntry() async {
    final String todayDate = _getTodayDateString();
    
    // 1. Format the current entry into a map
    Map<String, String> newEntry = {
      "Date": todayDate,
      "Go to Bed": answers[0],
      "Sleep Latency": answers[1],
      "Wake Up": answers[2],
      "Awakenings": answers[3],
      "Quality": answers[4],
      "Stimulants": answers[5],
      "Reflections": answers[6],
    };

    // 2. Add to the list
    diaryEntries.add(newEntry);

    // 3. Save the updated list and the last log date
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = jsonEncode(diaryEntries);
    await prefs.setString(prefsKey, encodedList);
    await prefs.setString(lastLogDateKey, todayDate); // Save the log date
    
    // Update local state to block new entries
    setState(() {
      hasLoggedToday = true;
    });
  }

  // --- Navigation Methods ---
  void _nextQuestion() {
    // Only save text/numerical answers here; time is saved in _pickTime()
    if (currentStep != 0 && currentStep != 2) {
        answers[currentStep] = _controller.text;
    }

    if (currentStep < questions.length - 1) {
      setState(() {
        currentStep++;
        _controller.text = answers[currentStep]; // Load answer for the next step
      });
    } else {
      // Last question completed: Save and reset
      _saveDiaryEntry().then((_) {
        // We only clear the controller, as hasLoggedToday is now true
        _controller.clear(); 
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Sleep Diary Saved! You can log again tomorrow.',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: primaryColor,
          ),
        );
        Navigator.pop(context, true); // Go back to FirstPage after saving (return true)
      });
    }
  }

  void _previousQuestion() {
    if (currentStep > 0) {
      // Save current answer before moving back
      if (currentStep != 0 && currentStep != 2) {
          answers[currentStep] = _controller.text;
      }
      
      setState(() {
        currentStep--;
        _controller.text = answers[currentStep]; // Load answer for the previous step
      });
    } else {
      Navigator.pop(context);
    }
  }

  Widget _buildInputWidget() {
    // Check for time-based questions
    if (currentStep == 0 || currentStep == 2) {
      return InkWell(
        onTap: _pickTime,
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            hintText: "Tap to select time...",
            hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
            suffixIcon: const Icon(Icons.access_time, color: primaryColor),
          ),
          // Display the selected time from the controller
          child: Text(
            _controller.text.isNotEmpty ? _controller.text : 'Select Time',
            style: GoogleFonts.poppins(
              fontSize: 18, 
              color: _controller.text.isNotEmpty ? primaryColor : Colors.grey[600],
            ),
          ),
        ),
      );
    }

    // Default to TextField for non-time-based questions (1, 3, 4, 5, 6)
    TextInputType inputType = TextInputType.text;
    if (currentStep == 1 || currentStep == 3 || currentStep == 4) {
      inputType = TextInputType.number;
    }
    
    return TextField(
      controller: _controller,
      keyboardType: inputType,
      maxLines: currentStep == 6 ? 3 : 1,
      style: GoogleFonts.poppins(fontSize: 18, color: primaryColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: currentStep == 6 ? "Enter your thoughts here..." : "Type your answer...",
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
      ),
    );
  }

  // Helper: map quality (string) to a color used in the entry badge
  Color _getQualityColor(String quality) {
    final q = int.tryParse(quality) ?? 0;
    switch (q) {
      case 1:
        return Colors.red.shade700;
      case 2:
        return Colors.orange.shade700;
      case 3:
        return Colors.amber.shade700;
      case 4:
        return Colors.green.shade700;
      case 5:
        return Colors.teal.shade700;
      default:
        return Colors.grey.shade600;
    }
  }

  // Helper: small labeled row used inside each diary entry card
  Widget _buildEntryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDiaryContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Progress Indicator
        LinearProgressIndicator(
          value: (currentStep + 1) / questions.length,
          backgroundColor: accentColor.withOpacity(0.5),
          color: primaryColor,
          minHeight: 10,
          borderRadius: BorderRadius.circular(5),
        ),
        const SizedBox(height: 25),

        // Question Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Question ${currentStep + 1} of ${questions.length}:",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                questions[currentStep],
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),

        // Input Field (Time Picker or Text Field)
        _buildInputWidget(),
        const SizedBox(height: 30),

        // Navigation Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Previous Button
            if (currentStep > 0)
              TextButton.icon(
                onPressed: _previousQuestion,
                icon: const Icon(Icons.arrow_back, color: primaryColor),
                label: Text(
                  'Back',
                  style: GoogleFonts.poppins(color: primaryColor, fontSize: 16),
                ),
              ),
            if (currentStep == 0)
              const SizedBox(width: 80),

            // Next/Submit Button
            ElevatedButton.icon(
              onPressed: _controller.text.isNotEmpty ? _nextQuestion : null,
              icon: Icon(
                currentStep < questions.length - 1 ? Icons.arrow_forward : Icons.check,
                color: Colors.white,
              ),
              label: Text(
                currentStep < questions.length - 1 ? 'Next' : 'Submit Log',
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLoggedTodayMessage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Icon(Icons.check_circle_outline, color: primaryColor, size: 80),
          const SizedBox(height: 20),
          Text(
            "Sleep Log Completed for Today!",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "You can only log your sleep once per day. Check back tomorrow for the next entry.",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          "Sleep Diary - Day ${diaryEntries.length + 1}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: primaryColor),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CONDITIONAL DISPLAY: Show diary or message
            if (isLoading)
              const Center(child: CircularProgressIndicator(color: primaryColor))
            else if (hasLoggedToday)
              _buildLoggedTodayMessage()
            else
              _buildDiaryContent(),

            // --- Past Entries Section ---
            const SizedBox(height: 50),
            Text(
              "Past Sleep Entries",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 15),

            if (diaryEntries.isEmpty && !isLoading)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.note_outlined, color: Colors.grey[400], size: 50),
                      const SizedBox(height: 15),
                      Text(
                        "No sleep entries logged yet.",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              // Display each entry as a card
              ...diaryEntries.reversed.map((entry) {
                final String date = entry["Date"] ?? "Unknown";
                final String bedTime = entry["Go to Bed"] ?? "-";
                final String latency = entry["Sleep Latency"] ?? "-";
                final String wakeTime = entry["Wake Up"] ?? "-";
                final String awakenings = entry["Awakenings"] ?? "-";
                final String quality = entry["Quality"] ?? "-";
                final String stimulants = entry["Stimulants"] ?? "-";
                final String reflections = entry["Reflections"] ?? "";

                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              date,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: primaryColor,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: _getQualityColor(quality).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Quality: $quality/5",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: _getQualityColor(quality),
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            "Bed: $bedTime • Woke: $wakeTime",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildEntryRow("Sleep Latency", "$latency min"),
                                const SizedBox(height: 12),
                                _buildEntryRow("Awakenings", awakenings),
                                const SizedBox(height: 12),
                                _buildEntryRow("Stimulants", stimulants),
                                if (reflections.isNotEmpty) ...[
                                  const SizedBox(height: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Reflections",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          reflections,
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.grey[700],
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
          ],
        ),
      ),
    );
  }
}