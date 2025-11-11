/// Quiz data for all 49 days of the CBT sleep improvement program.
/// Each quiz has 5 multiple-choice questions with one correct answer.

class QuizData {
  static final List<Map<String, dynamic>> quizzes = [
    // Week 1 — Start Tiny Habits
    // Day 1: Dim the Day, Prepare for Night
    {
      'day': 1,
      'title': 'Light & Melatonin Quiz',
      'questions': [
        {
          'question': 'What does bright light do to your melatonin levels at night?',
          'options': [
            'Increases them',
            'Has no effect',
            'Delays their release',
            'Converts them to cortisol',
          ],
          'correctIndex': 2, // "Delays their release"
        },
        {
          'question': 'Why are warm lights better before bed?',
          'options': [
            'They stimulate alertness',
            'They mimic morning light',
            'They mimic sunset and promote relaxation',
            'They reduce oxygen use',
          ],
          'correctIndex': 2, // "They mimic sunset and promote relaxation"
        },
        {
          'question': "What's the most effective way to cue wind-down time?",
          'options': [
            'Drink coffee',
            'Open windows',
            'Set a daily reminder alarm',
            'Stretch in bright light',
          ],
          'correctIndex': 2, // "Set a daily reminder alarm"
        },
        {
          'question': 'What light source delays your circadian rhythm?',
          'options': [
            'Candlelight',
            'Blue light from screens',
            'Yellow night lights',
            'Desk lamps with warm bulbs',
          ],
          'correctIndex': 1, // "Blue light from screens"
        },
        {
          'question': "What's the primary reason to dim lights before bed?",
          'options': [
            'To help your eyes adjust',
            'To reduce eye strain',
            'To signal melatonin production',
            'To change your mood',
          ],
          'correctIndex': 2, // "To signal melatonin production"
        },
      ],
    },
    // Week 5 — Wind Down Ritual (Days 29-35)
    {
      'day': 29,
      'title': 'Ritual Benefits Quiz',
      'questions': [
        {
          'question': 'How long does a wind-down ritual need to be effective?',
          'options': ['30 minutes minimum', '5 minutes is enough', '1 hour required', 'It must include a bath'],
          'correctIndex': 1,
        },
        {
          'question': 'What is one main benefit of repeating the same steps each night?',
          'options': ['It reduces muscle pain', 'It creates a sleep association', 'It increases dreams', 'It helps digestion'],
          'correctIndex': 1,
        },
        {
          'question': 'Why is screen time discouraged during wind-down?',
          'options': ['It reduces serotonin', 'It delays melatonin and stimulates alertness', 'It causes nightmares', 'It shortens REM'],
          'correctIndex': 1,
        },
        {
          'question': 'Which of these is NOT recommended before bed?',
          'options': ['Light breathing', 'Stretching', 'Doomscrolling', 'Journaling'],
          'correctIndex': 2,
        },
        {
          'question': 'When should you start winding down for bed?',
          'options': ['Immediately after dinner', '30–60 minutes before sleep', 'Only once you feel tired', 'After exercising'],
          'correctIndex': 1,
        },
      ],
    },
    {
      'day': 30,
      'title': 'Breathing Techniques Quiz',
      'questions': [
        {
          'question': 'What is the purpose of the 4-7-8 breathing pattern?',
          'options': ['Improve lung capacity', 'Relax the nervous system', 'Boost cardio endurance', 'Deepen REM sleep'],
          'correctIndex': 1,
        },
        {
          'question': 'How many rounds of 4-7-8 breathing are recommended?',
          'options': ['1', '3–5', '10+', 'Unlimited'],
          'correctIndex': 1,
        },
        {
          'question': 'What should you do if you feel dizzy during slow breathing?',
          'options': ['Push through', 'Stop and return to natural breathing', 'Try a longer hold', 'Breathe faster'],
          'correctIndex': 1,
        },
        {
          'question': 'Why pair breathing with dim lighting?',
          'options': ['To increase energy', 'To support melatonin release', 'To improve cardio', 'To raise alertness'],
          'correctIndex': 1,
        },
        {
          'question': 'Why use background sounds during wind-down?',
          'options': ['To stimulate brain activity', 'To energize your mood', 'To reduce distraction and promote calm', 'To delay bedtime'],
          'correctIndex': 2,
        },
      ],
    },
    {
      'day': 31,
      'title': 'Stretching for Sleep Quiz',
      'questions': [
        {
          'question': 'What\'s the benefit of light stretching before bed?',
          'options': ['Increases heart rate', 'Builds muscle', 'Releases tension and promotes calm', 'Delays fatigue'],
          'correctIndex': 2,
        },
        {
          'question': 'How long should each stretch be held?',
          'options': ['5 seconds', '15–30 seconds', '1 minute', 'As long as possible'],
          'correctIndex': 1,
        },
        {
          'question': 'What body areas are good to focus on for sleep stretching?',
          'options': ['Arms and chest', 'Core and back', 'Neck, shoulders, legs', 'Feet only'],
          'correctIndex': 2,
        },
        {
          'question': 'Why is dim lighting recommended during stretching?',
          'options': ['To enhance flexibility', 'To increase dopamine', 'To support your wind-down signal', 'To prevent injury'],
          'correctIndex': 2,
        },
        {
          'question': 'Which of these is NOT ideal in a bedtime stretch?',
          'options': ['Seated movements', 'Slow breathing', 'Intense squats', 'Gentle muscle holds'],
          'correctIndex': 2,
        },
      ],
    },
    {
      'day': 32,
      'title': 'Release Ritual Quiz',
      'questions': [
        {
          'question': 'What is the purpose of the "let go" sentence ritual?',
          'options': ['Analyze emotions', 'Boost memory', 'Gently offload the day\'s stress', 'Track to-do lists'],
          'correctIndex': 2,
        },
        {
          'question': 'What tone should your sentence take?',
          'options': ['Critical', 'Judgment-free', 'Ambitious', 'Problem-solving'],
          'correctIndex': 1,
        },
        {
          'question': 'What is a good phrase to pair with journaling?',
          'options': ['"I must do more tomorrow"', '"I failed again"', '"I\'ve done enough for today"', '"I\'m so behind"'],
          'correctIndex': 2,
        },
        {
          'question': 'Where should you keep your journal?',
          'options': ['Kitchen', 'Under your pillow', 'Near your bed', 'On your desk'],
          'correctIndex': 2,
        },
        {
          'question': 'How much time should this ritual take?',
          'options': ['15 minutes', '5 minutes', 'Less than 2 minutes', 'An hour'],
          'correctIndex': 2,
        },
      ],
    },
    {
      'day': 33,
      'title': 'Bed Association Deepening Quiz',
      'questions': [
        {
          'question': 'Why reserve your bed only for sleep?',
          'options': ['For storage', 'To improve spine alignment', 'To reinforce the sleep association', 'To improve blood pressure'],
          'correctIndex': 2,
        },
        {
          'question': 'What should you do if you can\'t fall asleep after 20 minutes?',
          'options': ['Force yourself to stay', 'Watch TV in bed', 'Get up and do something calm', 'Try exercise'],
          'correctIndex': 2,
        },
        {
          'question': 'Which activity breaks the sleep-bed association?',
          'options': ['Reading a physical book before bed (outside bed)', 'Scrolling Instagram in bed', 'Light breathing on the floor', 'Journaling at your desk'],
          'correctIndex': 1,
        },
        {
          'question': 'What happens if you stay in bed while fully awake for too long?',
          'options': ['Improved sleep duration', 'Reduced anxiety', 'Conditioned arousal and frustration', 'No change'],
          'correctIndex': 2,
        },
        {
          'question': 'When is it okay to return to bed?',
          'options': ['After eating', 'Once you feel drowsy', 'After a nap', 'After 2 hours'],
          'correctIndex': 1,
        },
      ],
    },
    {
      'day': 35,
      'title': 'Week 5 Reflection Quiz',
      'questions': [
        {
          'question': 'What is the goal of reflecting at the end of a week?',
          'options': ['To shame yourself', 'To spot patterns and keep what works', 'To compare with others', 'To quit the program'],
          'correctIndex': 1,
        },
        {
          'question': 'When reviewing the week, focus on:',
          'options': ['Every tiny mistake', 'Which small habits were helpful', 'Only sleep duration', 'How others slept'],
          'correctIndex': 1,
        },
        {
          'question': 'What is a practical outcome of weekly reflection?',
          'options': ['Change everything at once', 'Adjust one small habit', 'Stop trying new things', 'Increase caffeine'],
          'correctIndex': 1,
        },
        {
          'question': 'Reflection helps you decide to:',
          'options': ['Keep helpful rituals', 'Do the opposite of what worked', 'Ignore progress', 'Change your mattress weekly'],
          'correctIndex': 0,
        },
        {
          'question': 'A good weekly note is:',
          'options': ['Long and detailed each day', 'Short, clear, and action-oriented', 'Only focused on dreams', 'A list of failures'],
          'correctIndex': 1,
        },
      ],
    },
    
    {
      'day': 34,
      'title': 'Sensory Cues Quiz',
      'questions': [
        {
          'question': 'Which sense can be useful to cue relaxation?',
          'options': [
            'Strong bright light',
            'A consistent calming scent',
            'Loud music',
            'Cold showers',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why are consistent sensory cues helpful?',
          'options': [
            'They make sleep harder',
            'They train the brain to expect calm',
            'They increase anxiety',
            'They disrupt routines',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Which sensory cue is least likely to be helpful at night?',
          'options': [
            'Soft music',
            'Harsh flashing lights',
            'Warm dim lighting',
            'Familiar scent',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'A good sensory cue should be:',
          'options': [
            'Expensive and complex',
            'Noticeable and pleasant',
            'Uncomfortable',
            'Unpredictable',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'When introducing a new sensory cue, you should:',
          'options': [
            'Use it inconsistently',
            'Pair it regularly with calm routines',
            'Change it every night',
            'Avoid using it at all',
          ],
          'correctIndex': 1,
        },
      ],
    },
    {
      'day': 35,
      'title': 'Week 5 Reflection Quiz',
      'questions': [
        {
          'question': 'What is the goal of reflecting at the end of a week?',
          'options': [
            'To shame yourself',
            'To spot patterns and keep what works',
            'To compare with others',
            'To quit the program',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'When reviewing the week, focus on:',
          'options': [
            'Every tiny mistake',
            'Which small habits were helpful',
            'Only sleep duration',
            'How others slept',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What is a practical outcome of weekly reflection?',
          'options': [
            'Change everything at once',
            'Adjust one small habit',
            'Stop trying new things',
            'Increase caffeine',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Reflection helps you decide to:',
          'options': [
            'Keep helpful rituals',
            'Do the opposite of what worked',
            'Ignore progress',
            'Change your mattress weekly',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'A good weekly note is:',
          'options': [
            'Long and detailed each day',
            'Short, clear, and action-oriented',
            'Only focused on dreams',
            'A list of failures',
          ],
          'correctIndex': 1,
        },
      ],
    },
    // Day 2: The Phone Gap
    {
      'day': 2,
      'title': 'Screen Time Awareness Check',
      'questions': [
        {
          'question': 'Why is it recommended to charge your phone away from the bed?',
          'options': [
            'To prevent bedtime distractions',
            'To improve signal',
            'To charge faster',
            'To sync with alarm',
          ],
          'correctIndex': 0, // "To prevent bedtime distractions"
        },
        {
          'question': 'Which of these is most likely to disturb your sleep cues?',
          'options': [
            'A podcast',
            'A text alert',
            'Soft music',
            'A white noise machine',
          ],
          'correctIndex': 1, // "A text alert"
        },
        {
          'question': 'What is a benefit of using a physical alarm clock?',
          'options': [
            'It lets you wake up later',
            'It keeps you off your phone at night',
            'It helps you track heart rate',
            'It syncs to your calendar',
          ],
          'correctIndex': 1, // "It keeps you off your phone at night"
        },
        {
          'question': 'How long before bed should you stop using screens?',
          'options': [
            '5 minutes',
            '15 minutes',
            '30–45 minutes',
            'After lying in bed',
          ],
          'correctIndex': 2, // "30–45 minutes"
        },
        {
          'question': 'Which action helps protect your pre-sleep calm?',
          'options': [
            'Reading Twitter in bed',
            'Disabling notifications',
            'Playing a game',
            'Checking email',
          ],
          'correctIndex': 1, // "Disabling notifications"
        },
      ],
    },
    // Day 3: Offload the Mental Clutter
    {
      'day': 3,
      'title': 'Brain Dump Practice Quiz',
      'questions': [
        {
          'question': 'Why should you write down worries before bed?',
          'options': [
            'To avoid forgetting them',
            'To activate memory',
            'To reduce cognitive load',
            'To create a to-do list',
          ],
          'correctIndex': 2, // "To reduce cognitive load"
        },
        {
          'question': "What's the best format for a pre-sleep \"brain dump\"?",
          'options': [
            'Long detailed journal',
            'Social media post',
            'Short note on paper',
            'Voice memo',
          ],
          'correctIndex': 2, // "Short note on paper"
        },
        {
          'question': 'Why avoid using your phone to journal before bed?',
          'options': [
            "It's inconvenient",
            'It exposes you to blue light',
            "It's too slow",
            "It doesn't sync",
          ],
          'correctIndex': 1, // "It exposes you to blue light"
        },
        {
          'question': 'What habit reinforces letting go of stress at night?',
          'options': [
            'Reading news',
            'Scrolling social media',
            'Writing brief, non-judgmental thoughts',
            'Watching a documentary',
          ],
          'correctIndex': 2, // "Writing brief, non-judgmental thoughts"
        },
        {
          'question': "What's a key goal of the bedtime journaling habit?",
          'options': [
            'Perfection',
            'Analysis',
            'Mental release',
            'Creativity',
          ],
          'correctIndex': 2, // "Mental release"
        },
      ],
    },
    // Day 4: Caffeine's Quiet Echo
    {
      'day': 4,
      'title': 'Caffeine Knowledge Check',
      'questions': [
        {
          'question': "What's the main reason to stop caffeine after 2 PM?",
          'options': [
            'It causes dehydration',
            'It blocks melatonin',
            'It stays in your system and blocks sleep pressure',
            'It increases sugar cravings',
          ],
          'correctIndex': 2, // "It stays in your system and blocks sleep pressure"
        },
        {
          'question': 'Which of these may have hidden caffeine?',
          'options': [
            'Sparkling water',
            'Pain relievers',
            'Protein powder',
            'Bananas',
          ],
          'correctIndex': 1, // "Pain relievers"
        },
        {
          'question': 'Why is it important to track your individual caffeine response?',
          'options': [
            'So you can build tolerance',
            'Because sensitivity varies across people',
            'To reduce cravings',
            'To avoid addiction',
          ],
          'correctIndex': 1, // "Because sensitivity varies across people"
        },
        {
          'question': 'Which drink is a better evening option than coffee or tea?',
          'options': [
            'Diet soda',
            'Herbal tea',
            'Green tea',
            'Energy drink',
          ],
          'correctIndex': 1, // "Herbal tea"
        },
        {
          'question': 'Caffeine primarily interferes with:',
          'options': [
            'REM sleep',
            'Sleep pressure from adenosine',
            'Growth hormone',
            'Memory formation',
          ],
          'correctIndex': 1, // "Sleep pressure from adenosine"
        },
      ],
    },
    // Day 5: One Hour Window
    {
      'day': 5,
      'title': 'Circadian Rhythm Quiz',
      'questions': [
        {
          'question': "What's the most important anchor for your circadian rhythm?",
          'options': [
            'Bedtime',
            'Mealtime',
            'Wake-up time',
            'Shower time',
          ],
          'correctIndex': 2, // "Wake-up time"
        },
        {
          'question': 'Why should you limit weekend wake-up variation to under an hour?',
          'options': [
            'To save time',
            'To avoid stress',
            'To maintain your internal body clock',
            'To prevent naps',
          ],
          'correctIndex': 2, // "To maintain your internal body clock"
        },
        {
          'question': 'What does early morning light exposure do?',
          'options': [
            'Increases fatigue',
            'Delays circadian rhythm',
            'Boosts melatonin',
            'Resets your internal clock',
          ],
          'correctIndex': 3, // "Resets your internal clock"
        },
        {
          'question': 'Why is consistent wake-up time more important than bedtime at first?',
          'options': [
            "It's easier to control",
            "It's linked to digestion",
            'It lowers anxiety',
            'It drives natural sleep-wake cycles',
          ],
          'correctIndex': 3, // "It drives natural sleep-wake cycles"
        },
        {
          'question': 'What should you do if you had a poor night\'s sleep?',
          'options': [
            'Sleep in',
            'Nap for 3 hours',
            'Wake at your regular time',
            'Cancel your routine',
          ],
          'correctIndex': 2, // "Wake at your regular time"
        },
      ],
    },
    // Day 6: The "Sleep Zone" Rule
    {
      'day': 6,
      'title': 'Bed Association Check',
      'questions': [
        {
          'question': 'Why should you avoid using your bed for anything other than sleep or rest?',
          'options': [
            'To stay organized',
            'To reduce muscle strain',
            'To form a sleep cue association',
            'To increase productivity',
          ],
          'correctIndex': 2, // "To form a sleep cue association"
        },
        {
          'question': "What should you do if you're still awake after 20 minutes in bed?",
          'options': [
            'Watch TV in bed',
            'Try harder to sleep',
            'Get up and do something relaxing',
            'Check your phone',
          ],
          'correctIndex': 2, // "Get up and do something relaxing"
        },
        {
          'question': 'What is the goal of returning to bed only when sleepy?',
          'options': [
            'To burn calories',
            'To strengthen the mental sleep cue',
            'To improve digestion',
            'To tire yourself out',
          ],
          'correctIndex': 1, // "To strengthen the mental sleep cue"
        },
        {
          'question': 'What type of activity is best during a nighttime awakening?',
          'options': [
            'Stretching under bright light',
            'Phone scrolling',
            'Reading in dim light',
            'Walking outdoors',
          ],
          'correctIndex': 2, // "Reading in dim light"
        },
        {
          'question': 'Stimulus control is the CBT-I term for:',
          'options': [
            'Monitoring caffeine',
            'Rewiring your bed–sleep association',
            'Avoiding naps',
            'Adjusting your mattress',
          ],
          'correctIndex': 1, // "Rewiring your bed–sleep association"
        },
      ],
    },
    // Day 7: Keep It Light & Simple
    {
      'day': 7,
      'title': 'Progress Mindset Quiz',
      'questions': [
        {
          'question': "What's the primary goal of building a sleep routine?",
          'options': [
            'Perfect sleep',
            'Daily tracking',
            'Showing up regularly',
            'Deep analysis',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why should you avoid calling missed days "failures"?',
          'options': [
            "It's dishonest",
            'It leads to excuses',
            'Guilt lowers long-term motivation',
            'It reduces alertness',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s a recommended mindset shift during CBT-I?',
          'options': [
            'Strive for perfection',
            'Treat each day as a test',
            'View consistency as progress',
            'Focus on technical details',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why reflect weekly instead of daily?',
          'options': [
            'To remember more data',
            'To reduce emotional reactivity',
            'To track total sleep hours',
            'To boost memory recall',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What type of bedtime action should you choose?',
          'options': [
            'The easiest one available',
            'A hard challenge',
            'A multitasking one',
            'A tech-heavy routine',
          ],
          'correctIndex': 0,
        },
      ],
    },
    // Week 2 — Anchor Your Rhythm
    // Day 8: Why Wake Time Wins
    {
      'day': 8,
      'title': 'Wake Time Anchor Quiz',
      'questions': [
        {
          'question': 'What\'s the most important factor in anchoring your circadian rhythm?',
          'options': [
            'Bedtime',
            'Wake-up time',
            'Meal timing',
            'Caffeine intake',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does natural morning light do for your body clock?',
          'options': [
            'Increases melatonin',
            'Helps you fall asleep faster',
            'Signals wakefulness and stabilizes rhythm',
            'Makes you tired',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s one benefit of avoiding the snooze button?',
          'options': [
            'Improves appetite',
            'Reduces cortisol',
            'Prevents fragmented sleep and grogginess',
            'Promotes REM sleep',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s the maximum allowed variation for weekend wake-up time?',
          'options': [
            '±3 hours',
            '±90 minutes',
            '±1 hour',
            'It doesn\'t matter',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why should your wake-up time be "realistic"?',
          'options': [
            'So you can fall asleep later',
            'To match your TV schedule',
            'To ensure consistency and build the habit',
            'Because it helps you nap later',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 9: Bright Start, Better Sleep
    {
      'day': 9,
      'title': 'Morning Light Quiz',
      'questions': [
        {
          'question': 'What\'s the optimal type of light exposure in the morning?',
          'options': [
            'Dim indoor light',
            'Overhead fluorescent',
            'Outdoor natural light',
            'Blue nightlight',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why is combining movement with light exposure helpful?',
          'options': [
            'Increases alertness and locks in circadian reset',
            'Helps you fall asleep sooner',
            'Stimulates REM sleep',
            'Increases melatonin',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'What\'s the recommended time outdoors to benefit your rhythm?',
          'options': [
            '5 minutes',
            '15–30 minutes',
            '45 minutes',
            '2 hours',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why avoid sunglasses first thing in the morning?',
          'options': [
            'They reduce UV exposure',
            'They block your brain from receiving the light cue',
            'They are uncomfortable',
            'They trigger stress hormones',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'If outdoor light isn\'t available, what should you do?',
          'options': [
            'Use a flashlight',
            'Dim your lamps',
            'Sit by a window',
            'Wear a sleep mask',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 10: Win the Morning, Sleep Better at Night
    {
      'day': 10,
      'title': 'Morning Consistency Quiz',
      'questions': [
        {
          'question': 'What is "social jet lag"?',
          'options': [
            'Traveling across time zones',
            'Feeling tired at work',
            'Circadian misalignment from inconsistent schedules',
            'Too much caffeine',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s a key benefit of waking up at the same time every day?',
          'options': [
            'Less time needed to fall asleep at night',
            'You can stay up later',
            'You don\'t need an alarm',
            'You dream more',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'Why should naps be avoided early in CBT-I?',
          'options': [
            'They reduce hunger',
            'They disrupt your bedtime',
            'They increase REM sleep',
            'They improve focus too much',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does natural light in the morning do?',
          'options': [
            'Promotes hunger',
            'Increases fatigue',
            'Signals your brain to wake up',
            'Triggers anxiety',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s one way to gently wake with natural cues?',
          'options': [
            'Blackout curtains',
            'White noise',
            'Slightly open blinds',
            'Loud phone alarm',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 11: One Habit, Big Ripple
    {
      'day': 11,
      'title': 'Habit Reinforcement Quiz',
      'questions': [
        {
          'question': 'Why is it helpful to log your wake-up time daily?',
          'options': [
            'To compare with others',
            'To build awareness and habit accountability',
            'For calorie tracking',
            'For insurance records',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Which is an example of a consistent morning cue?',
          'options': [
            'Varying your wake time',
            'Scrolling in bed',
            'Drinking water and opening blinds',
            'Checking emails in bed',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What hormone system does wake-time regularity help regulate?',
          'options': [
            'Insulin',
            'Cortisol and melatonin',
            'Testosterone',
            'Adrenaline',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s a key principle in habit-building here?',
          'options': [
            'Variety',
            'Spontaneity',
            'Reinforcement',
            'Competition',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What is a small but effective way to reinforce a habit?',
          'options': [
            'Skip your morning routine',
            'Add extra tasks',
            'Acknowledge and reward consistency',
            'Sleep later on weekends',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 12: Don't Fix Bedtime—Yet
    {
      'day': 12,
      'title': 'Bedtime Flexibility Quiz',
      'questions': [
        {
          'question': 'Why shouldn\'t you force a strict bedtime early on?',
          'options': [
            'It leads to insomnia',
            'It increases productivity',
            'Sleepiness should guide when to sleep',
            'It wastes time',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What habit reinforces circadian alignment best?',
          'options': [
            'Taking melatonin',
            'Keeping bedtime flexible',
            'Sleeping in',
            'Waking at a fixed time',
          ],
          'correctIndex': 3,
        },
        {
          'question': 'What can undo the benefits of regular wake-up time?',
          'options': [
            'Evening journaling',
            'Morning light',
            'Evening screen use',
            'Light stretching',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s a sign your rhythm is starting to adjust?',
          'options': [
            'You need naps',
            'You\'re alert in the evening',
            'You feel sleepier around the same time daily',
            'You dream vividly',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'How long can circadian rhythm shifts take?',
          'options': [
            '2–3 days',
            '4 hours',
            'Several weeks',
            'One night',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 13: Light + Movement = Rhythm Reset
    {
      'day': 13,
      'title': 'Morning Ritual Quiz',
      'questions': [
        {
          'question': 'What is the ideal time to get outside after waking?',
          'options': [
            'Within 30 minutes',
            'After breakfast',
            'After lunch',
            'Doesn\'t matter',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'What\'s one benefit of gentle movement in the morning?',
          'options': [
            'Builds muscle',
            'Helps stabilize your circadian clock',
            'Reduces appetite',
            'Increases blood sugar',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why delay caffeine after waking?',
          'options': [
            'To build tolerance',
            'To save money',
            'To let cortisol rise naturally first',
            'To feel tired faster',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'How does music help your morning routine?',
          'options': [
            'Promotes REM sleep',
            'Stimulates hunger',
            'Reinforces wakefulness cues',
            'Increases melatonin',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s the goal of this daily light and movement combo?',
          'options': [
            'Burn calories',
            'Shift bedtime earlier',
            'Reset and strengthen circadian rhythm',
            'Replace alarm clocks',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 14: Week in Review: Momentum Matters
    {
      'day': 14,
      'title': 'Week 2 Reflection Quiz',
      'questions': [
        {
          'question': 'What matters most in early CBT-I?',
          'options': [
            'Sleep duration',
            'Consistency of behavior',
            'Dream content',
            'Number of tips completed',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why reflect on what was difficult?',
          'options': [
            'To track failures',
            'To stop trying',
            'To learn and adapt',
            'To compare with others',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why keep tracking wake-up time?',
          'options': [
            'To test memory',
            'To earn rewards',
            'To visually reinforce consistency',
            'To improve vocabulary',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s a helpful way to stay motivated?',
          'options': [
            'Focus on what you missed',
            'Reward small wins',
            'Add more complex steps',
            'Skip sleep logs',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does repetition do in habit formation?',
          'options': [
            'Causes boredom',
            'Trains the brain to automate the behavior',
            'Slows down progress',
            'Reduces cortisol',
          ],
          'correctIndex': 1,
        },
      ],
    },
    // Week 3 — Stimulus Control
    // Day 15: Build a Sleep-Only Zone
    {
      'day': 15,
      'title': 'Bed Association Basics Quiz',
      'questions': [
        {
          'question': 'What behavior weakens the bed-sleep association?',
          'options': [
            'Drinking water',
            'Reading emails in bed',
            'Brushing teeth',
            'Changing into pajamas',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why are screens harmful in bed?',
          'options': [
            'They increase oxygen levels',
            'They reduce REM',
            'They stimulate the brain and delay sleepiness',
            'They use too much battery',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What kind of reading should be avoided in bed?',
          'options': [
            'Poetry',
            'Emotional or intense material',
            'Light fiction',
            'Sleep manuals',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s the role of a "wind-down zone"?',
          'options': [
            'A place to exercise',
            'A space to eat',
            'A calming area separate from the bed',
            'A storage room',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What is the goal of stimulus control in CBT-I?',
          'options': [
            'Increase morning anxiety',
            'Condition your body to sleep elsewhere',
            'Strengthen the bed-sleep link',
            'Delay bedtime',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 16: Get Out of Bed When You Can't Sleep
    {
      'day': 16,
      'title': 'Sleep Onset Cue Quiz',
      'questions': [
        {
          'question': 'How long should you lie awake in bed before getting up?',
          'options': [
            '5 minutes',
            '~20 minutes',
            '1 hour',
            'Immediately',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What kind of activity should you do when getting out of bed?',
          'options': [
            'Watch TV',
            'Scroll your phone',
            'Read in dim light',
            'Exercise intensely',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why should you avoid looking at the clock?',
          'options': [
            'It resets your sleep cycle',
            'It activates problem-solving brain regions',
            'It helps you fall asleep',
            'It speeds up REM',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'When should you return to bed after waking?',
          'options': [
            'After 1 hour',
            'Only when you feel sleepy',
            'When you\'re hungry',
            'If the room is cold',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s the key reason to leave the bed when sleepless?',
          'options': [
            'To stretch',
            'To eat',
            'To preserve the bed-sleep association',
            'To hydrate',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 17: Break the Scroll–Bed Link
    {
      'day': 17,
      'title': 'Phone Habits Check',
      'questions': [
        {
          'question': 'What\'s a benefit of charging your phone away from bed?',
          'options': [
            'Faster charging',
            'Reduces temptation to scroll',
            'Boosts Wi-Fi',
            'Improves battery life',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What habit reinforces sleep readiness before bed?',
          'options': [
            'Reading notifications',
            'Watching Netflix',
            'Offline reflection like journaling',
            'Listening to news',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why is a physical alarm clock preferred?',
          'options': [
            'It\'s louder',
            'It saves money',
            'It prevents screen exposure at night',
            'It lights up the room',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s one benefit of tracking your bedtime habits?',
          'options': [
            'Improves grammar',
            'Reveals sleep-disrupting triggers',
            'Tracks hydration',
            'Reduces cortisol',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s a healthy phone substitute before bed?',
          'options': [
            'Reading Reddit',
            'Voice memos',
            'Writing in a journal',
            'Refreshing email',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 18: No Judgment Nights
    {
      'day': 18,
      'title': 'Self-Compassion Quiz',
      'questions': [
        {
          'question': 'What is the healthiest way to view a bad sleep night?',
          'options': [
            'As failure',
            'As punishment',
            'As a reset or learning point',
            'As time to worry',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why should you log how you respond to sleeplessness?',
          'options': [
            'To track cortisol',
            'To evaluate strategies',
            'To compare with others',
            'To count sleep cycles',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What impact does self-judgment have on sleep recovery?',
          'options': [
            'Positive—it motivates you',
            'Neutral',
            'Negative—it increases stress',
            'None',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What type of journal tone is recommended?',
          'options': [
            'Neutral',
            'Supportive and kind',
            'Strict and detailed',
            'Competitive',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why is kindness toward yourself important in CBT-I?',
          'options': [
            'It\'s more efficient',
            'It creates faster REM cycles',
            'It promotes resilience and reduces anxiety',
            'It builds muscle',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 19: Evening Associations Matter
    {
      'day': 19,
      'title': 'Wind-Down Routine Quiz',
      'questions': [
        {
          'question': 'Why is using the same room for winding down helpful?',
          'options': [
            'It saves space',
            'It reduces heating',
            'It creates a consistent cue for sleep',
            'It increases light',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What should be avoided in the evening wind-down routine?',
          'options': [
            'Journaling',
            'Kitchen or work zones',
            'Breathing exercises',
            'Dim lighting',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What type of cue helps reinforce "sleep mode"?',
          'options': [
            'Loud TV',
            'Screen flicker',
            'Repeated sensory inputs like scent or light',
            'Exercise',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'How can sleep clothing be a useful tool?',
          'options': [
            'It improves fashion',
            'It sends your brain a sleep signal',
            'It helps you feel warmer',
            'It boosts REM sleep',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What is the effect of avoiding consistency in bedtime routine?',
          'options': [
            'Deeper sleep',
            'Confuses the body clock',
            'More dreams',
            'Less hunger',
          ],
          'correctIndex': 1,
        },
      ],
    },
    // Day 20: Make Your Bed a Strong Cue
    {
      'day': 20,
      'title': 'Sleep Cue Reinforcement Quiz',
      'questions': [
        {
          'question': 'When should you get into bed?',
          'options': [
            'When you\'re bored',
            'At a fixed clock time',
            'When you feel genuinely sleepy',
            'When you\'ve finished eating',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s a downside of "trying" to sleep?',
          'options': [
            'Builds tolerance',
            'Increases frustration',
            'Improves REM sleep',
            'Lowers blood sugar',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does the 20-minute rule help reinforce?',
          'options': [
            'Wakefulness',
            'Bed-sleep association',
            'Memory consolidation',
            'Alarm usage',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What should you do if you\'re awake for more than 20 minutes in bed?',
          'options': [
            'Stay still',
            'Get up and do something calm',
            'Watch TV',
            'Turn up lights',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why track sleep onset time?',
          'options': [
            'For insurance',
            'To show your doctor',
            'To notice progress',
            'To find caffeine triggers',
          ],
          'correctIndex': 2,
        },
      ],
    },
    // Day 21: Week in Review — Rewriting Bed Habits
    {
      'day': 21,
      'title': 'Week 3 Reflection Quiz',
      'questions': [
        {
          'question': 'What\'s the value of reflecting on difficult habits?',
          'options': [
            'To avoid them completely',
            'To shame yourself',
            'To adjust and improve',
            'To compare with others',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why is celebrating even small behavioral wins powerful?',
          'options': [
            'Because CBT-I encourages perfection',
            'Because progress requires major changes',
            'Because small wins build identity and consistency',
            'Because rewards increase heart rate',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What might make it easier to change sleep habits?',
          'options': [
            'Changing everything at once',
            'Not tracking anything',
            'Focusing on one small shift',
            'Avoiding routine',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s the main takeaway from Week 3?',
          'options': [
            'Bedtime matters most',
            'Screens are always bad',
            'Build a strong bed-sleep association',
            'Don\'t reflect too much',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What will the next phase of CBT-I introduce?',
          'options': [
            'Cardio exercise',
            'Sleep restriction',
            'Cognitive restructuring',
            'More naps',
          ],
          'correctIndex': 2,
        },
      ],
    },

    // Week 4 — Cognitive Restructuring (Days 22-28)
    // Day 22: What You Think About Sleep Shapes How You Sleep
    {
      'day': 22,
      'title': 'Thoughts & Sleep Beliefs Quiz',
      'questions': [
        {
          'question': 'What is a common effect of unhelpful sleep beliefs?',
          'options': [
            'They make you more productive',
            'They can increase anxiety and worsen sleep',
            'They improve sleep duration',
            'They\'re harmless',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does logging your thoughts do?',
          'options': [
            'Keeps you awake',
            'Increases REM sleep',
            'Helps you gain perspective and reduce mental load',
            'Trains memory',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What should be your goal when analyzing sleep thoughts?',
          'options': [
            'Be brutally honest',
            'Force yourself to be positive',
            'Label whether they\'re helpful or not',
            'Repeat them daily',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why avoid fake optimism in CBT-I?',
          'options': [
            'It takes too long',
            'It creates resistance',
            'Realistic support works better than forced positivity',
            'It reduces sleep efficiency',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Which is an example of a helpful sleep thought?',
          'options': [
            'I\'m doomed if I don\'t sleep tonight',
            'My body knows how to rest',
            'I\'ll try to stay up all night',
            'I need to nap to survive',
          ],
          'correctIndex': 1,
        },
      ],
    },

    // Day 23: Catch the Thought, Don't Fight It
    {
      'day': 23,
      'title': 'Thought Neutrality Quiz',
      'questions': [
        {
          'question': 'What is a better response than "fighting" a negative thought?',
          'options': [
            'Believing it',
            'Ignoring it',
            'Observing it with neutrality',
            'Arguing with it',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why use the phrase "I\'m noticing the thought…"?',
          'options': [
            'It\'s a memory trick',
            'It distances you from the thought',
            'It delays REM',
            'It improves focus',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What effect does analyzing worries in bed have?',
          'options': [
            'Calms the brain',
            'Builds sleep pressure',
            'Activates alertness',
            'Improves sleep depth',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'When should you do a thought log?',
          'options': [
            'While lying awake',
            'After waking',
            'Before bed, paired with a calming activity',
            'Only in the morning',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What does curiosity toward thoughts do?',
          'options': [
            'Makes them stronger',
            'Reduces stress and reactivity',
            'Improves grammar',
            'Leads to lucid dreaming',
          ],
          'correctIndex': 1,
        },
      ],
    },

    // Day 24: Common Sleep Myths That Cause Harm
    {
      'day': 24,
      'title': 'Sleep Myths Challenge Quiz',
      'questions': [
        {
          'question': 'What\'s wrong with rigid beliefs about exact sleep duration?',
          'options': [
            'They reduce snoring',
            'They promote napping',
            'They increase sleep pressure and anxiety',
            'They help REM',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Is it normal to wake up briefly at night?',
          'options': [
            'No, it\'s a sleep disorder',
            'Yes, it\'s part of the sleep cycle',
            'Only if you drink coffee',
            'Only if you\'re anxious',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why is it important to challenge sleep myths?',
          'options': [
            'To control dreams',
            'To sleep longer',
            'To reduce unhelpful pressure',
            'To increase body temperature',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Which of the following is a flexible truth?',
          'options': [
            '"Everyone must sleep 8 hours"',
            '"Even with less sleep, I can get through the day"',
            '"Naps fix everything"',
            '"I can\'t function at all after one bad night"',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s the benefit of adaptive thinking about sleep?',
          'options': [
            'Builds mental safety',
            'Delays circadian rhythm',
            'Boosts dreams',
            'Increases hunger',
          ],
          'correctIndex': 0,
        },
      ],
    },

    // Day 25: Replace Fear with Realism
    {
      'day': 25,
      'title': 'Resilience & Evidence Quiz',
      'questions': [
        {
          'question': 'What\'s the best source of truth about your sleep patterns?',
          'options': [
            'Social media',
            'News articles',
            'Your personal sleep logs',
            'What friends say',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What should you notice after poor sleep?',
          'options': [
            'What you failed to do',
            'How little energy you had',
            'What you still accomplished',
            'What time you woke',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What is an example of all-or-nothing thinking?',
          'options': [
            '"I slept a little—I\'ll be okay"',
            '"If I don\'t sleep 8 hours, I\'ll crash completely"',
            '"My body will adjust"',
            '"I felt okay mid-morning"',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why does gentle reframing help?',
          'options': [
            'It makes you more productive',
            'It prevents REM',
            'It reduces fear and physiological arousal',
            'It tracks calories',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What is the goal of cognitive restructuring?',
          'options': [
            'Stop dreams',
            'Change how you feel by changing how you think',
            'Fall asleep instantly',
            'Block all worries',
          ],
          'correctIndex': 1,
        },
      ],
    },

    // Day 26: Your Sleep Thoughts Aren't Always True
    {
      'day': 26,
      'title': 'Scientific Thinking Quiz',
      'questions': [
        {
          'question': 'What\'s a helpful mental habit for sleep worries?',
          'options': [
            'Repeat them often',
            'Test them like a scientist',
            'Avoid writing them down',
            'Ignore them',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What\'s a common misconception about thoughts?',
          'options': [
            'They are all creative',
            'They are facts',
            'They are neutral',
            'They are dreams',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'How do sleep logs help reframe thought patterns?',
          'options': [
            'They\'re calming to write',
            'They make you sleepy',
            'They disprove exaggerated fears',
            'They improve vocabulary',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What phrase helps you assess unhelpful thoughts?',
          'options': [
            '"This thought is always right"',
            '"This thought defines me"',
            '"Is this helpful or noise?"',
            '"I need to fix this"',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'Why question your nighttime thoughts?',
          'options': [
            'It builds focus',
            'It helps you fall asleep faster',
            'It reduces their emotional intensity',
            'It triggers hunger',
          ],
          'correctIndex': 2,
        },
      ],
    },

    // Day 27: You're Allowed to Sleep Badly Sometimes
    {
      'day': 27,
      'title': 'Self-Permission Quiz',
      'questions': [
        {
          'question': 'What\'s one effect of perfectionism around sleep?',
          'options': [
            'More dreams',
            'Less guilt',
            'Increased anxiety and pressure',
            'Better memory',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What is a healthier mantra than "I must sleep well tonight"?',
          'options': [
            '"Let\'s see what happens"',
            '"I\'ll stay up until I drop"',
            '"I need to sleep perfectly"',
            '"I\'ll take melatonin again"',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'What matters more than perfect outcomes in CBT-I?',
          'options': [
            'Sleep tech',
            'Routines and consistency',
            'Daily naps',
            'Light exposure',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why write in your journal after a bad night?',
          'options': [
            'To plan breakfast',
            'To track dreams',
            'To release tension and guilt',
            'To remember your thoughts',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What mindset helps reduce performance pressure around sleep?',
          'options': [
            'Strict goals',
            'Flexibility and acceptance',
            'Competition',
            'Supplements',
          ],
          'correctIndex': 1,
        },
      ],
    },

    // Day 28: Week in Review — Thoughts Drive Sleep
    {
      'day': 28,
      'title': 'Week 4 Reflection Quiz',
      'questions': [
        {
          'question': 'Why reflect on your thought patterns weekly?',
          'options': [
            'For memory',
            'To track failures',
            'To identify helpful beliefs',
            'To journal more',
          ],
          'correctIndex': 2,
        },
        {
          'question': 'What\'s the value of naming one shift from the week?',
          'options': [
            'Builds identity and retention',
            'Improves sleep quality',
            'Helps your therapist',
            'Boosts vocabulary',
          ],
          'correctIndex': 0,
        },
        {
          'question': 'What does a "helpful thought" list support?',
          'options': [
            'Faster REM',
            'Rewiring brain patterns',
            'Dream clarity',
            'Focus',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'Why notice your body\'s response to thoughts?',
          'options': [
            'For calorie tracking',
            'To learn emotional links',
            'It improves digestion',
            'To reduce melatonin',
          ],
          'correctIndex': 1,
        },
        {
          'question': 'What does CBT-I teach about the relationship between thoughts and sleep?',
          'options': [
            'Thoughts are unimportant',
            'Thoughts cause sleep',
            'Thoughts can improve or interfere with sleep',
            'Sleep controls thoughts',
          ],
          'correctIndex': 2,
        },
      ],
    },
  ];

  /// Get quiz data for a specific day (1-49)
  static Map<String, dynamic>? getQuizForDay(int day) {
    // Find the map whose 'day' matches the requested day. This is robust to ordering.
    for (final q in quizzes) {
      final qDay = q['day'];
      if (qDay is int && qDay == day) return q;
    }
    return null;
  }
}
