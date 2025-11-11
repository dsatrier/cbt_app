import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatelessWidget {
  final String dayNumber;
  final String title;
  
  const SecondPage({
    super.key,
    required this.dayNumber,
    required this.title,
  });

  // Content database for all 35 days
  Map<String, Map<String, dynamic>> get contentDatabase => {
    "1": {
      "header": "Better Sleep Starts Tonight",
      "subtitle": "Simple strategies to help you fall asleep faster and wake up refreshed.",
      "tips": [
        {
          "title": "Stick to a Sleep Schedule",
          "description": "Go to bed and wake up at the same time every day, even on weekends. This helps regulate your body's internal clock and makes it easier to fall asleep and wake up naturally.",
        },
        {
          "title": "Create a Relaxing Bedtime Routine",
          "description": "Wind down 30-60 minutes before bed with calming activities like reading, gentle stretching, or meditation. Avoid screens and bright lights during this time.",
        },
        {
          "title": "Optimize Your Sleep Environment",
          "description": "Keep your bedroom cool, dark, and quiet. Consider using blackout curtains, earplugs, or a white noise machine. Your mattress and pillows should be comfortable and supportive.",
        },
        {
          "title": "Watch What You Eat and Drink",
          "description": "Avoid caffeine after 2 PM and large meals close to bedtime. While alcohol might make you drowsy, it disrupts sleep quality. A light snack before bed is okay if you're hungry.",
        },
        {
          "title": "Get Regular Exercise",
          "description": "Regular physical activity can help you fall asleep faster and enjoy deeper sleep. Just avoid vigorous exercise within 3 hours of bedtime, as it can be too stimulating.",
        },
      ],
      "bottomNote": "Remember: It may take a few weeks for these changes to make a noticeable difference. Be patient and consistent with your new sleep habits.",
    },
    "2": {
      "header": "Understanding Your Sleep Cycles",
      "subtitle": "Learn how sleep stages work and why they matter for your rest.",
      "tips": [
        {
          "title": "Light Sleep (Stage 1 & 2)",
          "description": "This is the transition between wakefulness and sleep. Your body temperature drops, heart rate slows, and you can be easily awakened. This makes up about 50% of your sleep.",
        },
        {
          "title": "Deep Sleep (Stage 3)",
          "description": "The most restorative sleep stage. Your body repairs tissues, builds bone and muscle, and strengthens your immune system. This is when you're hardest to wake up.",
        },
        {
          "title": "REM Sleep",
          "description": "Rapid Eye Movement sleep is when most dreaming occurs. Your brain processes emotions and consolidates memories. REM periods get longer as the night progresses.",
        },
        {
          "title": "Complete Sleep Cycles",
          "description": "A full cycle takes about 90 minutes. You need 4-6 complete cycles per night for optimal rest. Waking up mid-cycle can leave you feeling groggy.",
        },
        {
          "title": "Timing Matters",
          "description": "Deep sleep dominates early night, while REM increases toward morning. This is why consistent sleep timing helps you feel more refreshed.",
        },
      ],
      "bottomNote": "Understanding your sleep cycles helps you plan better sleep schedules and wake times for optimal rest.",
    },
    "3": {
      "header": "Creating Your Sleep Sanctuary",
      "subtitle": "Transform your bedroom into the perfect environment for restorative sleep.",
      "tips": [
        {
          "title": "Control the Temperature",
          "description": "The ideal bedroom temperature is between 60-67°F (15-19°C). A cooler room helps your body's natural temperature drop that signals sleep time.",
        },
        {
          "title": "Eliminate Light Sources",
          "description": "Use blackout curtains or an eye mask. Even small amounts of light can disrupt your circadian rhythm. Cover or remove LED lights from electronics.",
        },
        {
          "title": "Minimize Noise Disruption",
          "description": "Use earplugs, a white noise machine, or a fan to mask disruptive sounds. Consistent background noise is better than silence interrupted by sudden sounds.",
        },
        {
          "title": "Invest in Quality Bedding",
          "description": "Your mattress should support your spine's natural alignment. Replace pillows every 1-2 years and mattresses every 7-10 years. Choose breathable, comfortable fabrics.",
        },
        {
          "title": "Keep Electronics Out",
          "description": "Remove TVs, computers, and work materials from your bedroom. Your brain should associate your bedroom only with sleep and relaxation.",
        },
      ],
      "bottomNote": "Small environmental changes can have a big impact on your sleep quality. Start with one improvement at a time.",
    },
    "4": {
      "header": "Managing Screen Time for Better Sleep",
      "subtitle": "Understanding how technology affects your sleep and what to do about it.",
      "tips": [
        {
          "title": "The Blue Light Problem",
          "description": "Blue light from screens suppresses melatonin production, making it harder to fall asleep. This effect is strongest in the 2-3 hours before bed.",
        },
        {
          "title": "Set a Digital Curfew",
          "description": "Stop using all screens at least 1 hour before bed. Use this time for relaxing activities like reading a physical book, gentle stretching, or meditation.",
        },
        {
          "title": "Use Night Mode Features",
          "description": "If you must use devices in the evening, enable night mode or blue light filters. While not as good as avoiding screens, it's better than nothing.",
        },
        {
          "title": "Keep Phones Out of Reach",
          "description": "Charge your phone across the room or in another room. This prevents late-night scrolling and removes the temptation to check it if you wake up.",
        },
        {
          "title": "Replace Screen Time",
          "description": "Find evening activities you enjoy that don't involve screens: journaling, light stretching, listening to calming music, or preparing for tomorrow.",
        },
      ],
      "bottomNote": "Breaking the screen habit before bed can be challenging, but your sleep quality will improve significantly within a few weeks.",
    },
    "5": {
      "header": "Relaxation Techniques for Better Sleep",
      "subtitle": "Powerful methods to calm your mind and body before bed.",
      "tips": [
        {
          "title": "4-7-8 Breathing Technique",
          "description": "Breathe in for 4 counts, hold for 7, exhale for 8. This activates your parasympathetic nervous system, naturally calming your body and preparing it for sleep.",
        },
        {
          "title": "Progressive Muscle Relaxation",
          "description": "Tense and release each muscle group from toes to head. This releases physical tension and helps you become aware of areas holding stress.",
        },
        {
          "title": "Guided Imagery",
          "description": "Visualize a peaceful scene in detail using all your senses. This occupies your mind with calming thoughts instead of worries or to-do lists.",
        },
        {
          "title": "Body Scan Meditation",
          "description": "Focus attention on different parts of your body, releasing tension as you go. This grounds you in the present moment and away from racing thoughts.",
        },
        {
          "title": "Gentle Yoga Stretches",
          "description": "Simple poses like child's pose, legs-up-the-wall, or supine twists release physical tension and signal to your body that it's time to wind down.",
        },
      ],
      "bottomNote": "Try different techniques to find what works best for you. Consistency is key—practice nightly for best results.",
    },
    "6": {
      "header": "Diet and Sleep Connection",
      "subtitle": "What you eat and when you eat it can significantly impact your sleep quality.",
      "tips": [
        {
          "title": "Timing Your Meals",
          "description": "Finish large meals 3-4 hours before bed. A full stomach can cause discomfort and acid reflux. If hungry later, have a light snack 1-2 hours before sleep.",
        },
        {
          "title": "Sleep-Promoting Foods",
          "description": "Foods rich in tryptophan, magnesium, and melatonin help sleep: almonds, turkey, chamomile tea, kiwi, tart cherry juice, and fatty fish. Include these in evening meals.",
        },
        {
          "title": "Cut Caffeine Strategically",
          "description": "Caffeine stays in your system 6-8 hours. Avoid it after 2 PM. Remember that chocolate, some teas, and medications also contain caffeine.",
        },
        {
          "title": "Alcohol's Sleep Impact",
          "description": "While alcohol may help you fall asleep, it disrupts REM sleep and causes nighttime awakenings. Avoid alcohol 3-4 hours before bed.",
        },
        {
          "title": "Stay Hydrated Wisely",
          "description": "Drink enough water during the day but taper off in the evening to avoid nighttime bathroom trips. Stop drinking fluids 2 hours before bed.",
        },
      ],
      "bottomNote": "Small dietary adjustments can lead to noticeable improvements in sleep quality within just a few days.",
    },
    "7": {
      "header": "Exercise for Better Sleep",
      "subtitle": "Learn how physical activity can dramatically improve your sleep quality.",
      "tips": [
        {
          "title": "The Exercise-Sleep Connection",
          "description": "Regular exercise helps you fall asleep faster, increases deep sleep, and reduces stress. Even 10 minutes daily can make a difference.",
        },
        {
          "title": "Best Times to Exercise",
          "description": "Morning or afternoon exercise is ideal. It raises body temperature, and the subsequent drop hours later promotes sleepiness. Avoid vigorous exercise 3 hours before bed.",
        },
        {
          "title": "Types of Beneficial Exercise",
          "description": "Both aerobic exercise (walking, swimming, cycling) and strength training improve sleep. Consistency matters more than intensity for sleep benefits.",
        },
        {
          "title": "Evening Movement Options",
          "description": "Gentle activities like yoga, stretching, or leisurely walks are perfect for evening. They help you unwind without being too stimulating.",
        },
        {
          "title": "Outdoor Exercise Bonus",
          "description": "Exercise outdoors when possible. Natural light exposure helps regulate your circadian rhythm, making it easier to fall asleep at night.",
        },
      ],
      "bottomNote": "Start slowly and build consistency. Even light daily movement can significantly improve your sleep over time.",
    },
  };

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
              // Header Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF93679D),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Text(
                        content["header"],
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content["subtitle"],
                        style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                        textAlign: TextAlign.center,
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
                    SizedBox(height: verticalSpacing),
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
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFA995AE),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number Circle
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF543B5B),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  number,
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: GoogleFonts.poppins(
                      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}