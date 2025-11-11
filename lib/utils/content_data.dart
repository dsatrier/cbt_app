/// Centralized content data for the 7-week CBT-I sleep program
/// Organizes all reading articles, assessments, and quiz references by week and day.

class ContentData {
  // Week titles
  static const Map<int, String> weekTitles = {
    1: 'Start Tiny Habits',
    2: 'Anchor Your Rhythm',
    3: 'Stimulus Control',
    4: 'Cognitive Restructuring',
    5: 'Wind Down Rituals',
    6: 'Tackle Awakenings',
    7: 'Review & Reinforce',
  };

  // Daily content organized by week
  // Each day has a reading title, assessment title, and optional quiz day reference
  static const Map<int, List<Map<String, String>>> dailyContentByWeek = {
    1: [
      // Week 1: Start Tiny Habits (Days 1-7)
      {
        'day': '1',
        'reading': 'Dim the Day, Prepare for Night',
        'assessment': 'Light & Melatonin Quiz',
      },
      {
        'day': '2',
        'reading': 'The Phone Gap',
        'assessment': 'Screen Time Awareness Check',
      },
      {
        'day': '3',
        'reading': 'Offload the Mental Clutter',
        'assessment': 'Brain Dump Practice Quiz',
      },
      {
        'day': '4',
        'reading': 'Caffeine\'s Quiet Echo',
        'assessment': 'Caffeine Knowledge Check',
      },
      {
        'day': '5',
        'reading': 'One Hour Window',
        'assessment': 'Circadian Rhythm Quiz',
      },
      {
        'day': '6',
        'reading': 'The "Sleep Zone" Rule',
        'assessment': 'Bed Association Check',
      },
      {
        'day': '7',
        'reading': 'Keep It Light & Simple',
        'assessment': 'Progress Mindset Quiz',
      },
    ],
    2: [
      // Week 2: Anchor Your Rhythm (Days 8-14)
      {
        'day': '8',
        'reading': 'Why Wake Time Wins',
        'assessment': 'Wake Time Anchor Quiz',
      },
      {
        'day': '9',
        'reading': 'Bright Start, Better Sleep',
        'assessment': 'Morning Light Quiz',
      },
      {
        'day': '10',
        'reading': 'Win the Morning, Sleep Better at Night',
        'assessment': 'Morning Consistency Quiz',
      },
      {
        'day': '11',
        'reading': 'One Habit, Big Ripple',
        'assessment': 'Habit Reinforcement Quiz',
      },
      {
        'day': '12',
        'reading': 'Don\'t Fix Bedtime—Yet',
        'assessment': 'Bedtime Flexibility Quiz',
      },
      {
        'day': '13',
        'reading': 'Light + Movement = Rhythm Reset',
        'assessment': 'Morning Ritual Quiz',
      },
      {
        'day': '14',
        'reading': 'Week in Review: Momentum Matters',
        'assessment': 'Week 2 Reflection Quiz',
      },
    ],
    3: [
      // Week 3: Stimulus Control (Days 15-21)
      {
        'day': '15',
        'reading': 'Build a Sleep-Only Zone',
        'assessment': 'Bed Association Basics Quiz',
      },
      {
        'day': '16',
        'reading': 'Get Out of Bed When You Can\'t Sleep',
        'assessment': 'Sleep Onset Cue Quiz',
      },
      {
        'day': '17',
        'reading': 'Break the Scroll–Bed Link',
        'assessment': 'Phone Habits Check',
      },
      {
        'day': '18',
        'reading': 'No Judgment Nights',
        'assessment': 'Self-Compassion Quiz',
      },
      {
        'day': '19',
        'reading': 'Evening Associations Matter',
        'assessment': 'Wind-Down Routine Quiz',
      },
      {
        'day': '20',
        'reading': 'Make Your Bed a Strong Cue',
        'assessment': 'Sleep Cue Reinforcement Quiz',
      },
      {
        'day': '21',
        'reading': 'Week in Review — Rewriting Bed Habits',
        'assessment': 'Week 3 Reflection Quiz',
      },
    ],
    4: [
      // Week 4: Cognitive Restructuring (Days 22-28)
      {
        'day': '22',
        'reading': 'What You Think About Sleep Shapes How You Sleep',
        'assessment': 'Thoughts & Sleep Beliefs Quiz',
      },
      {
        'day': '23',
        'reading': 'Catch the Thought, Don\'t Fight It',
        'assessment': 'Thought Neutrality Quiz',
      },
      {
        'day': '24',
        'reading': 'Common Sleep Myths That Cause Harm',
        'assessment': 'Sleep Myths Challenge Quiz',
      },
      {
        'day': '25',
        'reading': 'Replace Fear with Realism',
        'assessment': 'Resilience & Evidence Quiz',
      },
      {
        'day': '26',
        'reading': 'Your Sleep Thoughts Aren\'t Always True',
        'assessment': 'Scientific Thinking Quiz',
      },
      {
        'day': '27',
        'reading': 'You\'re Allowed to Sleep Badly Sometimes',
        'assessment': 'Self-Permission Quiz',
      },
      {
        'day': '28',
        'reading': 'Week in Review — Thoughts Drive Sleep',
        'assessment': 'Week 4 Reflection Quiz',
      },
    ],
    5: [
      // Week 5: Wind Down Rituals (Days 29-35)
      {
        'day': '29',
        'reading': 'Why You Need a Wind-Down Ritual',
        'assessment': 'Ritual Benefits Quiz',
      },
      {
        'day': '30',
        'reading': 'Breathe to Slow the Mind',
        'assessment': 'Breathing Techniques Quiz',
      },
      {
        'day': '31',
        'reading': 'Light Stretching for Stillness',
        'assessment': 'Stretching for Sleep Quiz',
      },
      {
        'day': '32',
        'reading': 'Let It Go With One Sentence',
        'assessment': 'Release Ritual Quiz',
      },
      {
        'day': '33',
        'reading': 'Create a "Sleep-Only" Zone',
        'assessment': 'Bed Association Deepening Quiz',
      },
      {
        'day': '34',
        'reading': 'Use Senses to Signal Calm',
        'assessment': 'Sensory Cues Quiz',
      },
      {
        'day': '35',
        'reading': 'Make It Yours',
        'assessment': 'Week 5 Reflection Quiz',
      },
    ],
    6: [
      // Week 6: Tackle Awakenings (Days 36-42)
      {
        'day': '36',
        'reading': 'Night Waking Is Normal',
        'assessment': 'Normalization Quiz',
      },
      {
        'day': '37',
        'reading': 'What to Do When You Can\'t Sleep',
        'assessment': 'Awake Strategies Quiz',
      },
      {
        'day': '38',
        'reading': 'Your Body Still Gets Rest',
        'assessment': 'Rest vs. Sleep Quiz',
      },
      {
        'day': '39',
        'reading': 'Don\'t Make the Bed the Enemy',
        'assessment': 'Bed Safety Quiz',
      },
      {
        'day': '40',
        'reading': 'Let Go of the Chase',
        'assessment': 'Effort Release Quiz',
      },
      {
        'day': '41',
        'reading': 'Build Your Midnight Toolkit',
        'assessment': 'Toolkit Preparation Quiz',
      },
      {
        'day': '42',
        'reading': 'Your Sleep Confidence Plan',
        'assessment': 'Week 6 Reflection Quiz',
      },
    ],
    7: [
      // Week 7: Review & Reinforce (Days 43-49)
      {
        'day': '43',
        'reading': 'Your Sleep, Then vs. Now',
        'assessment': 'Progress Reflection Quiz',
      },
      {
        'day': '44',
        'reading': 'Keep What Worked',
        'assessment': 'Habit Selection Quiz',
      },
      {
        'day': '45',
        'reading': 'Drop What Didn\'t Work',
        'assessment': 'Adaptation Quiz',
      },
      {
        'day': '46',
        'reading': 'Your Sleep Identity',
        'assessment': 'Identity Shift Quiz',
      },
      {
        'day': '47',
        'reading': 'Reinforce with Reflection',
        'assessment': 'Learning Integration Quiz',
      },
      {
        'day': '48',
        'reading': 'Plan for Setbacks',
        'assessment': 'Resilience Plan Quiz',
      },
      {
        'day': '49',
        'reading': 'This Is the Start of Ownership',
        'assessment': 'Mastery & Continuation Quiz',
      },
    ],
  };

  /// Get the title for a given week (1-7)
  static String getWeekTitle(int week) {
    return weekTitles[week] ?? 'Week $week';
  }

  /// Get all daily content for a given week
  static List<Map<String, String>> getWeekContent(int week) {
    return dailyContentByWeek[week] ?? [];
  }

  /// Get the content for a specific day (1-49)
  static Map<String, String>? getContentForDay(int dayNumber) {
    for (int week = 1; week <= 7; week++) {
      final weekContent = dailyContentByWeek[week] ?? [];
      for (var dayContent in weekContent) {
        if (int.parse(dayContent['day']!) == dayNumber) {
          return dayContent;
        }
      }
    }
    return null;
  }

  /// Get total number of days in the program
  static int getTotalDays() {
    int total = 0;
    for (int week = 1; week <= 7; week++) {
      total += (dailyContentByWeek[week]?.length ?? 0);
    }
    return total;
  }
}
