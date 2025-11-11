import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

class ThirdPage extends StatefulWidget {
  final String dayNumber;
  final String title;

  const ThirdPage({
    super.key,
    required this.dayNumber,
    required this.title,
  });

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;
  bool hasAnswered = false;
  bool showingFeedback = false;
  int correctAnswers = 0;
  bool showIntro = true;

  // Assessment database for all 35 days
  Map<String, Map<String, dynamic>> get assessmentDatabase => {
    "1": {
      "introTitle": "Sleep Quality Assessment",
      "introDescription": "Test your knowledge about sleep fundamentals and discover areas where you can improve your sleep habits.",
      "questions": [
        QuizQuestion(
          question: "What is the recommended amount of sleep for adults?",
          options: ["5-6 hours", "7-9 hours", "10-12 hours", "4-5 hours"],
          correctAnswerIndex: 1,
          explanation: "Adults need 7-9 hours of sleep per night for optimal health and functioning.",
        ),
        QuizQuestion(
          question: "Which hormone is primarily responsible for regulating sleep?",
          options: ["Insulin", "Melatonin", "Adrenaline", "Dopamine"],
          correctAnswerIndex: 1,
          explanation: "Melatonin is the hormone that helps control your sleep-wake cycle and is produced by your brain in response to darkness.",
        ),
        QuizQuestion(
          question: "What should you avoid before bedtime for better sleep?",
          options: ["Reading", "Blue light from screens", "Stretching", "Meditation"],
          correctAnswerIndex: 1,
          explanation: "Blue light from screens suppresses melatonin production and can make it harder to fall asleep.",
        ),
        QuizQuestion(
          question: "What is the ideal bedroom temperature for sleep?",
          options: ["75-80°F", "60-67°F", "50-55°F", "70-75°F"],
          correctAnswerIndex: 1,
          explanation: "Research shows that 60-67°F (15-19°C) is the optimal temperature range for quality sleep.",
        ),
      ],
    },
    "2": {
      "introTitle": "Bedtime Routine Check",
      "introDescription": "Assess your understanding of effective bedtime routines and how they impact sleep quality.",
      "questions": [
        QuizQuestion(
          question: "How long before bed should you start your wind-down routine?",
          options: ["5-10 minutes", "30-60 minutes", "2-3 hours", "Right before bed"],
          correctAnswerIndex: 1,
          explanation: "Starting your wind-down routine 30-60 minutes before bed gives your body time to transition from wakefulness to sleep.",
        ),
        QuizQuestion(
          question: "Which activity is BEST for a bedtime routine?",
          options: ["Checking work emails", "Watching TV", "Reading a physical book", "Playing video games"],
          correctAnswerIndex: 2,
          explanation: "Reading a physical book is relaxing and doesn't expose you to blue light, making it ideal for bedtime.",
        ),
        QuizQuestion(
          question: "What happens when you have an inconsistent bedtime?",
          options: ["Nothing changes", "Your circadian rhythm gets disrupted", "You sleep better", "You need less sleep"],
          correctAnswerIndex: 1,
          explanation: "Inconsistent sleep schedules disrupt your circadian rhythm, making it harder to fall asleep and wake up naturally.",
        ),
        QuizQuestion(
          question: "Which of these helps signal to your brain it's time to sleep?",
          options: ["Bright lights", "Heavy meals", "Dimming lights", "Caffeine"],
          correctAnswerIndex: 2,
          explanation: "Dimming lights in the evening helps trigger melatonin production, signaling your body it's time for sleep.",
        ),
      ],
    },
    "3": {
      "introTitle": "Bedroom Assessment",
      "introDescription": "Evaluate your knowledge about creating the perfect sleep environment.",
      "questions": [
        QuizQuestion(
          question: "What color temperature is best for bedroom lighting?",
          options: ["Cool white (blue)", "Warm yellow/orange", "Bright white", "Green"],
          correctAnswerIndex: 1,
          explanation: "Warm yellow/orange light mimics natural sunset and promotes melatonin production, while blue light suppresses it.",
        ),
        QuizQuestion(
          question: "How often should you replace your pillow?",
          options: ["Every 5 years", "Every 10 years", "Every 1-2 years", "Never"],
          correctAnswerIndex: 2,
          explanation: "Pillows should be replaced every 1-2 years as they lose support and can harbor dust mites and allergens.",
        ),
        QuizQuestion(
          question: "What makes the ideal sleep environment?",
          options: ["Warm, bright, and noisy", "Cool, dark, and quiet", "Warm, dark, and quiet", "Cool, bright, and quiet"],
          correctAnswerIndex: 1,
          explanation: "A cool, dark, and quiet environment promotes the best sleep quality by supporting your body's natural sleep processes.",
        ),
        QuizQuestion(
          question: "Why should you avoid keeping work materials in your bedroom?",
          options: ["It looks messy", "Your brain associates the bedroom with work/stress", "It takes up space", "No reason"],
          correctAnswerIndex: 1,
          explanation: "Your brain should associate your bedroom only with sleep and relaxation, not work or stress.",
        ),
      ],
    },
    "4": {
      "introTitle": "Technology Usage Review",
      "introDescription": "Test your understanding of how technology affects sleep and what you can do about it.",
      "questions": [
        QuizQuestion(
          question: "How long before bed should you stop using screens?",
          options: ["30 minutes", "At least 1 hour", "5 minutes", "It doesn't matter"],
          correctAnswerIndex: 1,
          explanation: "Stopping screen use at least 1 hour before bed gives your body time to start producing melatonin naturally.",
        ),
        QuizQuestion(
          question: "What does blue light from screens do?",
          options: ["Helps you sleep", "Suppresses melatonin", "Has no effect", "Increases melatonin"],
          correctAnswerIndex: 1,
          explanation: "Blue light suppresses melatonin production, making it harder to fall asleep and reducing sleep quality.",
        ),
        QuizQuestion(
          question: "Where should you charge your phone at night?",
          options: ["On your nightstand", "Under your pillow", "Across the room or in another room", "On your bed"],
          correctAnswerIndex: 2,
          explanation: "Keeping your phone away from your bed prevents late-night scrolling and removes notification disruptions.",
        ),
        QuizQuestion(
          question: "Are blue light filter apps as good as avoiding screens?",
          options: ["Yes, they're exactly the same", "No, but they're better than nothing", "They're even better", "They make it worse"],
          correctAnswerIndex: 1,
          explanation: "Blue light filters help, but avoiding screens entirely is still the best option for optimal sleep.",
        ),
      ],
    },
    "5": {
      "introTitle": "Stress Level Check",
      "introDescription": "Assess your knowledge of relaxation techniques and stress management for better sleep.",
      "questions": [
        QuizQuestion(
          question: "What is the 4-7-8 breathing technique?",
          options: ["Breathe in 4, hold 7, out 8", "Breathe in 8, hold 7, out 4", "Breathe in 4, hold 4, out 4", "Breathe in 7, hold 8, out 4"],
          correctAnswerIndex: 0,
          explanation: "The 4-7-8 technique involves breathing in for 4 counts, holding for 7, and exhaling for 8, which activates your relaxation response.",
        ),
        QuizQuestion(
          question: "What is progressive muscle relaxation?",
          options: ["Exercising before bed", "Tensing and releasing muscle groups", "Stretching only your legs", "Avoiding all movement"],
          correctAnswerIndex: 1,
          explanation: "Progressive muscle relaxation involves systematically tensing and releasing each muscle group to release physical tension.",
        ),
        QuizQuestion(
          question: "When should you practice relaxation techniques?",
          options: ["Only when stressed", "As part of your nightly routine", "In the morning only", "Never"],
          correctAnswerIndex: 1,
          explanation: "Practicing relaxation techniques regularly as part of your bedtime routine helps train your body to relax on cue.",
        ),
        QuizQuestion(
          question: "Which activity helps reduce pre-sleep anxiety?",
          options: ["Checking social media", "Worrying about tomorrow", "Guided imagery or meditation", "Watching the news"],
          correctAnswerIndex: 2,
          explanation: "Guided imagery and meditation help calm racing thoughts and reduce anxiety, making it easier to fall asleep.",
        ),
      ],
    },
    "6": {
      "introTitle": "Nutrition Assessment",
      "introDescription": "Test your understanding of how diet affects sleep quality.",
      "questions": [
        QuizQuestion(
          question: "How long before bed should you finish large meals?",
          options: ["Right before bed", "30 minutes", "1-2 hours", "3-4 hours"],
          correctAnswerIndex: 3,
          explanation: "Finishing large meals 3-4 hours before bed prevents discomfort and acid reflux that can disrupt sleep.",
        ),
        QuizQuestion(
          question: "Which food is rich in sleep-promoting tryptophan?",
          options: ["Coffee", "Turkey", "Soda", "Chips"],
          correctAnswerIndex: 1,
          explanation: "Turkey is rich in tryptophan, an amino acid that helps produce serotonin and melatonin, promoting better sleep.",
        ),
        QuizQuestion(
          question: "When should you stop drinking caffeine?",
          options: ["8 PM", "6 PM", "2 PM", "Anytime is fine"],
          correctAnswerIndex: 2,
          explanation: "Caffeine stays in your system 6-8 hours, so stopping by 2 PM ensures it won't interfere with nighttime sleep.",
        ),
        QuizQuestion(
          question: "What effect does alcohol have on sleep?",
          options: ["Improves sleep quality", "Helps you sleep through the night", "Disrupts REM sleep", "No effect"],
          correctAnswerIndex: 2,
          explanation: "While alcohol may help you fall asleep, it disrupts REM sleep and causes nighttime awakenings, reducing sleep quality.",
        ),
      ],
    },
    "7": {
      "introTitle": "Activity Level Review",
      "introDescription": "Assess your knowledge about exercise and its impact on sleep.",
      "questions": [
        QuizQuestion(
          question: "How does regular exercise affect sleep?",
          options: ["Makes it worse", "Helps you fall asleep faster", "Has no effect", "Only works for athletes"],
          correctAnswerIndex: 1,
          explanation: "Regular exercise helps you fall asleep faster, increases deep sleep duration, and reduces stress and anxiety.",
        ),
        QuizQuestion(
          question: "When is the best time to do vigorous exercise?",
          options: ["Right before bed", "Morning or afternoon", "Only at night", "It doesn't matter"],
          correctAnswerIndex: 1,
          explanation: "Morning or afternoon exercise is ideal. Vigorous exercise too close to bedtime can be too stimulating.",
        ),
        QuizQuestion(
          question: "How much daily exercise can improve sleep?",
          options: ["At least 3 hours", "Even 10 minutes", "Only 2+ hours count", "Exercise doesn't help sleep"],
          correctAnswerIndex: 1,
          explanation: "Even 10 minutes of daily movement can improve sleep quality. Consistency matters more than duration.",
        ),
        QuizQuestion(
          question: "What type of evening exercise is best for sleep?",
          options: ["High-intensity cardio", "Heavy weightlifting", "Gentle yoga or stretching", "Competitive sports"],
          correctAnswerIndex: 2,
          explanation: "Gentle activities like yoga or stretching help you unwind without being too stimulating before bed.",
        ),
      ],
    },
  };

  late List<QuizQuestion> questions;
  late String introTitle;
  late String introDescription;

  @override
  void initState() {
    super.initState();
    _loadAssessmentContent();
  }

  void _loadAssessmentContent() {
    final assessment = assessmentDatabase[widget.dayNumber] ?? assessmentDatabase["1"]!;
    questions = List<QuizQuestion>.from(assessment["questions"]);
    introTitle = assessment["introTitle"];
    introDescription = assessment["introDescription"];
  }

  void selectAnswer(int index) {
    if (hasAnswered) return;

    setState(() {
      selectedAnswerIndex = index;
      hasAnswered = true;

      if (index == questions[currentQuestionIndex].correctAnswerIndex) {
        correctAnswers++;
      }

      showingFeedback = true;
    });
  }

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
        hasAnswered = false;
        showingFeedback = false;
      });
    } else {
      _showResultsDialog();
    }
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFFEBEAE2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          "Quiz Complete!",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF543B5B),
          ),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "You got",
              style: GoogleFonts.poppins(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "$correctAnswers / ${questions.length}",
              style: GoogleFonts.poppins(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF93679D),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "correct answers!",
              style: GoogleFonts.poppins(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF93679D),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                "Done",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    const horizontalPadding = 20.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBEAE2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
      body: SafeArea(
        child: showIntro
            ? _introScreen()
            : (showingFeedback
                ? _buildFeedbackScreen(question, horizontalPadding)
                : _buildQuestionScreen(question, horizontalPadding)),
      ),
    );
  }

  Widget _introScreen() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFA995AE),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.quiz_outlined,
              size: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            introTitle,
            style: GoogleFonts.poppins(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF543B5B),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            introDescription,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black87,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF93679D),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              setState(() {
                showIntro = false;
              });
            },
            child: Text(
              "Start Assessment",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionScreen(QuizQuestion question, double horizontalPadding) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1} of ${questions.length}",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Score: $correctAnswers",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xFF93679D),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF93679D),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                question.question,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ...List.generate(question.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  onTap: () => selectAnswer(index),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEAE2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFFA995AE),
                        width: 2,
                      ),
                    ),
                    child: Text(
                      question.options[index],
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackScreen(QuizQuestion question, double horizontalPadding) {
    final isCorrect = selectedAnswerIndex == question.correctAnswerIndex;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isCorrect
              ? [Colors.green.shade50, Colors.green.shade100]
              : [Colors.red.shade50, Colors.red.shade100],
        ),
      ),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: isCorrect
                      ? const AssetImage("/home/aadi/Desktop/tp/test_drive/lib/assets/close.jpg")
                      : const AssetImage("/home/aadi/Desktop/tp/test_drive/lib/assets/open.jpg"),
                  height: 120,
                  width: 120,
                ),
                const SizedBox(height: 30),
                Text(
                  isCorrect ? "Great Job!" : "Not Quite Right",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF543B5B),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (!isCorrect) ...[
                        Text(
                          "The correct answer is:",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.green, width: 2),
                          ),
                          child: Text(
                            question.options[question.correctAnswerIndex],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                      Text(
                        question.explanation,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF93679D),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: nextQuestion,
                  child: Text(
                    currentQuestionIndex < questions.length - 1
                        ? "Next Question"
                        : "Finish Quiz",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}