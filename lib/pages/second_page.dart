import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_drive/utils/article_data.dart';

class SecondPage extends StatelessWidget {
  final String dayNumber;
  final String title;
  
  const SecondPage({
    super.key,
    required this.dayNumber,
    required this.title,
  });

  // Use centralized article data when available (ArticleData). SecondPage will read articles from
  // `ArticleData.articles` by day number string. We keep a tiny fallback if an entry is missing.
  Map<String, Map<String, dynamic>> get contentDatabase {
    final Map<String, Map<String, dynamic>> db = {};
    // Copy entries from ArticleData (if present) into a local map for easy access.
    ArticleData.articles.forEach((key, value) {
      db[key] = value;
    });
    // Fallback for day 1 if not provided
    db.putIfAbsent('1', () => {
      'header': 'Better Sleep Starts Tonight',
      'subtitle': 'Simple strategies to help you fall asleep faster and wake up refreshed.',
      'tips': [
        {'title': 'Stick to a Sleep Schedule', 'description': 'Go to bed and wake up at the same time every day.'},
      ],
      'bottomNote': 'Small changes repeated will compound over time.'
    });
    return db;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final verticalSpacing = screenHeight * 0.03;
    const horizontalPadding = 20.0;

    // Get content for this day, fallback to day 1 if not found
    final content = contentDatabase[dayNumber] ?? contentDatabase["1"]!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEBEAE2),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // Header Container (enhanced)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
                  decoration: BoxDecoration(
                    color: const Color(0xFF93679D),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.18),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Decorative icon
                      Container(
                        width: 68,
                        height: 68,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(Icons.bedtime, size: 36, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
                      // Header texts
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content["header"],
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              content["subtitle"],
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: verticalSpacing),

              // Dynamic tips
              ...List.generate(content["tips"].length, (index) {
                final tip = content["tips"][index];
                return Column(
                  children: [
                    _buildTipCard(
                      context,
                      number: "${index + 1}",
                      title: tip["title"],
                      description: tip["description"],
                    ),
                    SizedBox(height: verticalSpacing * 0.8),
                  ],
                );
              }),

              // Bottom Note
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEBEAE2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    content["bottomNote"],
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[700],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTipCard(BuildContext context, {
    required String number,
    required String title,
    required String description,
  }) {
    const horizontalPadding = 20.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Material(
        color: Colors.white,
        elevation: 6,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Number Circle (accent)
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF93679D),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.18),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    number,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: const Color(0xFF543B5B),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}