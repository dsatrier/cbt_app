import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_drive/utils/quiz_data.dart';

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

  // Instead of a hardcoded assessment map, load quizzes from QuizData
  // QuizData stores questions as maps; here we adapt them into QuizQuestion objects.
  Map<String, Map<String, dynamic>> get assessmentDatabase {
    final Map<String, Map<String, dynamic>> db = {};
    // We won't eagerly build every day; ThirdPage will call _loadAssessmentContent which uses QuizData.
    return db;
  }

  late List<QuizQuestion> questions;
  late String introTitle;
  late String introDescription;

  @override
  void initState() {
    super.initState();
    _loadAssessmentContent();
  }

  void _loadAssessmentContent() {
    // Try to get quiz from QuizData (which uses a list of maps where each map has 'day','title','questions')
    final dayInt = int.tryParse(widget.dayNumber) ?? 1;
    final quizMap = QuizData.getQuizForDay(dayInt);

    if (quizMap != null) {
      introTitle = quizMap['title'] ?? widget.title;
      introDescription = quizMap['description'] ?? '';
      final rawQuestions = (quizMap['questions'] as List<dynamic>? ) ?? [];
      questions = rawQuestions.map<QuizQuestion>((q) {
        final List<String> opts = List<String>.from(q['options'] ?? []);
        final int correct = q['correctIndex'] ?? 0;
        return QuizQuestion(
          question: q['question'] ?? '',
          options: opts,
          correctAnswerIndex: correct,
          explanation: q['explanation'] ?? '',
        );
      }).toList();
    } else {
      // Fallback simple placeholder quiz if none defined
      introTitle = widget.title;
      introDescription = 'Short assessment.';
      questions = [
        QuizQuestion(
          question: 'This quiz is not available for this day yet.',
          options: ['OK'],
          correctAnswerIndex: 0,
          explanation: '',
        ),
      ];
    }
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
                // Close dialog, then pop page returning `true` to indicate completion
                Navigator.pop(context);
                Navigator.pop(context, true);
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