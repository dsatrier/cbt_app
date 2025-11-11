import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ReflectionPage extends StatefulWidget {
  const ReflectionPage({super.key});

  @override
  State<ReflectionPage> createState() => ReflectionPageState();
}

class ReflectionPageState extends State<ReflectionPage> {
  // --- Styling Constants ---
  static const Color primaryColor = Color(0xFF93679D);
  static const Color accentColor = Color(0xFFA995AE);
  static const Color backgroundColor = Color(0xFFEBEAE2);
  static const String prefsKey = 'reflectionEntries';
  static const String lastLogDateKey = 'lastReflectionDate';

  // --- State Variables ---
  int currentStep = 0;
  List<String> questions = [
    "How helpful was today's lesson? (Rate 1-5: 1=Not helpful, 5=Very helpful)",
    "What tips from today's lesson did you implement?",
    "Will you continue to implement these tips? (Yes/No/Maybe)",
    "What's one thing you're taking away from this lesson?",
  ];
  List<String> answers = List.filled(4, "");
  List<Map<String, String>> reflectionEntries = [];
  bool isLoading = true;
  bool hasLoggedToday = false;

  // --- Controllers ---
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_updateButtonState);
    _loadReflectionEntries();
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

  // --- Utility Method ---
  String _getTodayDateString() {
    return DateTime.now().toIso8601String().substring(0, 10);
  }

  // --- Persistence Methods ---
  Future<void> _loadReflectionEntries() async {
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
      reflectionEntries = tempEntries;
      hasLoggedToday = lastLogDate == _getTodayDateString();
      isLoading = false;
    });
  }

  Future<void> _saveReflectionEntry() async {
    final String todayDate = _getTodayDateString();

    // 1. Format the current entry into a map
    Map<String, String> newEntry = {
      "Date": todayDate,
      "Helpfulness Rating": answers[0],
      "Tips Implemented": answers[1],
      "Will Continue": answers[2],
      "Key Takeaway": answers[3],
    };

    // 2. Add to the list
    reflectionEntries.add(newEntry);

    // 3. Save the updated list and the last log date
    final prefs = await SharedPreferences.getInstance();
    final String encodedList = jsonEncode(reflectionEntries);
    await prefs.setString(prefsKey, encodedList);
    await prefs.setString(lastLogDateKey, todayDate);

    // Update local state to block new entries
    setState(() {
      hasLoggedToday = true;
    });
  }

  // --- Navigation Methods ---
  void _nextQuestion() {
    answers[currentStep] = _controller.text;

    if (currentStep < questions.length - 1) {
      setState(() {
        currentStep++;
        _controller.text = answers[currentStep];
      });
    } else {
      // Last question completed: Save and reset
      _saveReflectionEntry().then((_) {
        _controller.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Reflection saved! You can reflect again tomorrow.',
              style: GoogleFonts.poppins(),
            ),
            backgroundColor: primaryColor,
          ),
        );
        Navigator.pop(context);
      });
    }
  }

  void _previousQuestion() {
    if (currentStep > 0) {
      answers[currentStep] = _controller.text;

      setState(() {
        currentStep--;
        _controller.text = answers[currentStep];
      });
    } else {
      Navigator.pop(context);
    }
  }

  // --- Widget Builders ---
  Widget _buildInputWidget() {
    TextInputType inputType = TextInputType.text;
    int? maxLines = 1;

    // Question 0: Rating (1-5)
    if (currentStep == 0) {
      inputType = TextInputType.number;
    }
    // Question 1 and 3: Longer text responses
    else if (currentStep == 1 || currentStep == 3) {
      maxLines = 3;
    }
    // Question 2: Yes/No/Maybe (could add dropdown, but keeping TextField for consistency)

    return TextField(
      controller: _controller,
      keyboardType: inputType,
      maxLines: maxLines,
      style: GoogleFonts.poppins(fontSize: 18, color: primaryColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        hintText: _getHintText(),
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
      ),
    );
  }

  String _getHintText() {
    switch (currentStep) {
      case 0:
        return "Enter a number from 1 to 5...";
      case 1:
        return "Describe the tips you tried...";
      case 2:
        return "Type Yes, No, or Maybe...";
      case 3:
        return "What's your main takeaway?";
      default:
        return "Type your answer...";
    }
  }

  Widget _buildReflectionContent() {
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

        // Input Field
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
            if (currentStep == 0) const SizedBox(width: 80),

            // Next/Submit Button
            ElevatedButton.icon(
              onPressed: _controller.text.isNotEmpty ? _nextQuestion : null,
              icon: Icon(
                currentStep < questions.length - 1
                    ? Icons.arrow_forward
                    : Icons.check,
                color: Colors.white,
              ),
              label: Text(
                currentStep < questions.length - 1 ? 'Next' : 'Submit',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
            "Reflection Completed for Today!",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "You can only submit one reflection per day. Check back tomorrow for the next entry.",
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
          "Reflection Tracker - Day ${reflectionEntries.length + 1}",
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
            // CONDITIONAL DISPLAY: Show reflection form or message
            if (isLoading)
              const Center(
                  child: CircularProgressIndicator(color: primaryColor))
            else if (hasLoggedToday)
              _buildLoggedTodayMessage()
            else
              _buildReflectionContent(),

            // --- CSV Output Section ---
            const SizedBox(height: 50),
            Text(
              "Past Reflections (CSV Format)",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),

            // Display the CSV header
            Text(
              "Date,Helpfulness Rating,Tips Implemented,Will Continue,Key Takeaway",
              style: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.bold),
            ),

            // Display each entry
            ...reflectionEntries.reversed.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  entry.values.join(','),
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              );
            }).toList(),

            if (reflectionEntries.isEmpty && !isLoading)
              Text(
                "No reflections logged yet.",
                style:
                    GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              ),
          ],
        ),
      ),
    );
  }
}