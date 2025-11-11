/// Article content for days 1-49 (Weeks 1-7)
/// Each entry contains header, subtitle, tips (list of {title, description}), and bottomNote.
class ArticleData {
  static const Map<String, Map<String, dynamic>> articles = {
    // Week 1: Start Tiny Habits (Days 1-7)
    '1': {
      'header': 'Dim the Day, Prepare for Night',
      'subtitle': 'Small lighting shifts trigger your brain to begin winding down.',
      'tips': [
        {'title': 'Dim lights 30 minutes before bed', 'description': 'Bright light delays melatonin, your natural sleep hormone. Lower lighting cues your body to shift into wind-down mode.'},
        {'title': 'Use warm-toned lighting', 'description': 'Warm hues mimic sunset tones and reduce cognitive stimulation, preparing your brain for rest.'},
        {'title': 'Power down screens early', 'description': 'Screens emit blue light, which tricks your brain into thinking it is daytime and suppresses melatonin.'},
        {'title': 'Set a "wind-down" alarm', 'description': 'A simple reminder builds consistency and helps cue your body clock every evening.'},
      ],
      'bottomNote': 'Light is one of the strongest signals to your internal clock—start dimming 30 minutes before bed for best results.'
    },
    '2': {
      'header': 'The Phone Gap',
      'subtitle': 'Creating space from screens helps your brain transition to sleep mode.',
      'tips': [
        {'title': 'Charge your phone away from your bed', 'description': 'Keeping your phone nearby encourages scrolling and disrupts the bed-sleep association.'},
        {'title': 'Disable nonessential notifications at night', 'description': 'Even a single ping can trigger alertness and disrupt your calm pre-sleep state.'},
        {'title': 'Use a physical alarm clock', 'description': 'Reduces the need to reach for your phone and fall into late-night scrolling loops.'},
        {'title': 'Set a screen-off time 45 minutes before bed', 'description': 'Reducing mental stimulation and light exposure makes it easier to fall asleep naturally.'},
      ],
      'bottomNote': 'The "phone gap" is often the single biggest shift people notice—your sleep will improve once you reclaim your evenings.'
    },
    '3': {
      'header': 'Offload the Mental Clutter',
      'subtitle': 'A quick brain dump clears racing thoughts and signals safety to your nervous system.',
      'tips': [
        {'title': 'Write down one worry before bed', 'description': 'Externalizing a thought lowers cognitive load and helps reduce racing thoughts.'},
        {'title': 'Use a notepad, not your phone', 'description': 'Physical writing avoids screen light and distraction loops.'},
        {'title': 'Set a "brain dump" routine', 'description': 'Routine offloading teaches your brain it is safe to let go of the day\'s stress.'},
        {'title': 'Keep it short and judgment-free', 'description': 'Even a 30-second entry builds the habit and creates emotional distance from thoughts.'},
      ],
      'bottomNote': 'Journaling before bed tells your brain "I\'ve handled it"—this simple act quiets the mind.'
    },
    '4': {
      'header': 'Caffeine\'s Quiet Echo',
      'subtitle': 'Caffeine lingers longer than you think—timing matters more than quantity.',
      'tips': [
        {'title': 'Stop caffeine after 2 PM', 'description': 'Caffeine can stay active for 6–8 hours, blocking adenosine, the brain\'s sleep-pressure chemical.'},
        {'title': 'Know hidden sources', 'description': 'Chocolate, tea, sodas, and even some painkillers contain caffeine and can affect your sleep without you realizing it.'},
        {'title': 'Track your reaction', 'description': 'Some people are more sensitive; even morning coffee can impact sleep for certain individuals.'},
        {'title': 'Switch to herbal tea', 'description': 'Chamomile, peppermint, and lemon balm can be soothing alternatives that do not interfere with rest.'},
      ],
      'bottomNote': 'Caffeine after 2 PM is one of the easiest levers to pull—notice the shift in your sleep within 3–5 days.'
    },
    '5': {
      'header': 'One Hour Window',
      'subtitle': 'Your body has a natural rhythm—consistency anchors it.',
      'tips': [
        {'title': 'Aim for consistent wake time', 'description': 'Your circadian rhythm functions best with predictable wake signals, like light and movement.'},
        {'title': 'Stay within a ±1 hr window even on weekends', 'description': 'Large wake time shifts disrupt your biological clock and make falling asleep harder later.'},
        {'title': 'Expose yourself to morning light', 'description': 'Natural light in the morning resets your sleep-wake rhythm and increases alertness.'},
        {'title': 'Don\'t fixate on bedtime', 'description': 'Waking at the same time anchors your rhythm; bedtime will naturally adjust over time.'},
      ],
      'bottomNote': 'Wake time is the most powerful sleep lever—lock it in first, and bedtime will follow.'
    },
    '6': {
      'header': 'The "Sleep Zone" Rule',
      'subtitle': 'Your bed is for sleep only—this one rule changes everything.',
      'tips': [
        {'title': 'Use your bed only for sleep and rest', 'description': 'Your brain forms associations; if your bed is where you scroll or snack, it won\'t cue sleep.'},
        {'title': 'Get up if you can\'t sleep after about 20 minutes', 'description': 'Lying awake reinforces anxiety and weakens the bed-sleep connection.'},
        {'title': 'Do a calm activity in dim light', 'description': 'Shifting to a low-stimulation space helps reset your mind without reactivating alertness.'},
        {'title': 'Return only when sleepy', 'description': 'This teaches your brain that bed = sleepiness, not frustration or alertness.'},
      ],
      'bottomNote': 'This is stimulus control—one of the most powerful CBT-I tools. Stick with it for two weeks to see the shift.'
    },
    '7': {
      'header': 'Keep It Light & Simple',
      'subtitle': 'Showing up matters more than perfection.',
      'tips': [
        {'title': 'Your goal is showing up, not being perfect', 'description': 'Building consistency, even if small, creates habits that compound over time.'},
        {'title': 'If you miss a day, call it a reset not a failure', 'description': 'Framing matters; guilt kills motivation, but self-compassion sustains it.'},
        {'title': 'Pick the easiest action each night', 'description': 'Simplicity lowers resistance, which increases adherence.'},
        {'title': 'Reflect weekly, not daily, on progress', 'description': 'Zooming out reduces judgment and helps you see the big picture.'},
      ],
      'bottomNote': 'Progress over perfection—one small consistent step beats perfect behavior you can\'t maintain.'
    },

    // Week 2: Anchor Your Rhythm (Days 8-14)
    '8': {
      'header': 'Why Wake Time Wins',
      'subtitle': 'Your circadian rhythm is anchored by one thing: when you wake up.',
      'tips': [
        {'title': 'Pick a realistic wake-up time', 'description': 'Starting with a time you can stick to most days helps stabilize your body clock and builds early momentum.'},
        {'title': 'Use a morning alarm even on weekends', 'description': 'Waking up at the same time daily (plus or minus 1 hour) keeps your circadian rhythm aligned and reduces grogginess.'},
        {'title': 'Open your curtains right away', 'description': 'Morning light is the strongest time cue for your biological clock. It promotes alertness and lifts mood.'},
        {'title': 'Don\'t hit snooze', 'description': 'Interrupted dozing confuses your sleep cycle and increases sleep inertia.'},
      ],
      'bottomNote': 'Your wake time is the anchor—lock it in, and the rest of your sleep will follow.'
    },
    '9': {
      'header': 'Bright Start, Better Sleep',
      'subtitle': 'Morning light is the most powerful reset button for your sleep-wake cycle.',
      'tips': [
        {'title': 'Get at least 15 minutes of outdoor light early', 'description': 'Morning light suppresses melatonin and resets your clock more effectively than indoor light.'},
        {'title': 'Do a quick stretch or walk outside', 'description': 'Movement plus light boosts wakefulness faster than light alone.'},
        {'title': 'Avoid sunglasses for the first 20 minutes', 'description': 'Unfiltered daylight directly signals your brain to shift into wake mode.'},
        {'title': 'If indoors, sit near a bright window', 'description': 'Any light exposure is better than none, especially within the first hour of waking.'},
      ],
      'bottomNote': 'Morning light + movement = the fastest way to reset your internal clock.'
    },
    '10': {
      'header': 'Win the Morning, Sleep Better at Night',
      'subtitle': 'Consistency in the morning builds momentum for sleep at night.',
      'tips': [
        {'title': 'Set a non-negotiable wake-up time', 'description': 'Consistency anchors your internal clock, making it easier to fall asleep at night.'},
        {'title': 'Resist weekend sleep-ins', 'description': 'Sleeping in disrupts circadian rhythm and can cause social jet lag.'},
        {'title': 'Keep bedroom curtains slightly open', 'description': 'Natural light in the morning helps your body wake more naturally.'},
        {'title': 'Avoid naps until rhythm stabilizes', 'description': 'Napping can reduce sleep pressure, delaying sleep onset at night.'},
      ],
      'bottomNote': 'Even one week of consistent wake times will shift your evening sleepiness—trust the process.'
    },
    '11': {
      'header': 'One Habit, Big Ripple',
      'subtitle': 'One anchor creates a cascade of positive changes.',
      'tips': [
        {'title': 'Anchor one consistent cue: wake-up time', 'description': 'A fixed wake-up time trains your body to release hormones and energy on schedule.'},
        {'title': 'Build your morning ritual around it', 'description': 'Predictable actions (stretch, hydrate, light) signal the brain that it is time to engage.'},
        {'title': 'Track wake time in your log', 'description': 'Logging builds awareness and accountability.'},
        {'title': 'Reward yourself for consistency', 'description': 'Positive reinforcement builds habit momentum, no matter how small the win.'},
      ],
      'bottomNote': 'One consistent habit ripples through your whole day—choose your anchor and stick with it.'
    },
    '12': {
      'header': 'Don\'t Fix Bedtime—Yet',
      'subtitle': 'Let your body tell you when to sleep, don\'t force the clock.',
      'tips': [
        {'title': 'Focus only on wake time, not bedtime', 'description': 'Bedtime becomes easier once your body knows when to start the day.'},
        {'title': 'Let sleepiness guide your bedtime', 'description': 'Forcing sleep at a fixed time often backfires. Sleep drive builds naturally with consistent waking.'},
        {'title': 'No screens in the last hour', 'description': 'Blue light delays melatonin, which undermines the gains from consistent waking.'},
        {'title': 'Be patient—your rhythm is adjusting', 'description': 'Circadian shifts take time, but the payoff is long-term sleep efficiency.'},
      ],
      'bottomNote': 'Trust your body—bedtime will come naturally once your wake time is solid.'
    },
    '13': {
      'header': 'Light + Movement = Rhythm Reset',
      'subtitle': 'Combine two powerful signals for maximum impact.',
      'tips': [
        {'title': 'Step outside within 30 minutes of waking', 'description': 'This gives your circadian system a strong daytime signal, improving alertness and future sleep.'},
        {'title': 'Move your body even lightly', 'description': 'Light activity boosts mood and helps the body fully wake up.'},
        {'title': 'Avoid caffeine until 90 minutes after waking', 'description': 'Let your cortisol rise naturally first then caffeine adds less jitter and more sustained focus.'},
        {'title': 'Create a short morning playlist', 'description': 'Sound and movement reinforce routine and mood.'},
      ],
      'bottomNote': 'Light + movement creates a synergy that resets your whole day—your sleep will thank you.'
    },
    '14': {
      'header': 'Week in Review: Momentum Matters',
      'subtitle': 'Reflect on the foundation you\'ve built.',
      'tips': [
        {'title': 'You showed up—consistency wins', 'description': 'The brain needs repetition to form automatic cues. Every wake-up matters more than perfection.'},
        {'title': 'Reflect on what felt easy versus hard', 'description': 'Awareness of obstacles lets you troubleshoot without guilt.'},
        {'title': 'Keep logging wake time next week', 'description': 'Tracking supports habit formation by making progress visible.'},
        {'title': 'Plan one reward for your progress', 'description': 'Celebrating small wins keeps motivation strong.'},
      ],
      'bottomNote': 'You\'ve anchored your rhythm—week 3 builds on this foundation to strengthen your sleep association.'
    },

    // Week 3: Stimulus Control (Days 15-21)
    '15': {
      'header': 'Build a Sleep-Only Zone',
      'subtitle': 'Your brain is a learning machine—make the bed your sleep signal.',
      'tips': [
        {'title': 'Use your bed only for sleep and rest', 'description': 'The brain forms strong associations. If you scroll or study in bed your brain will not link the bed with sleep.'},
        {'title': 'No screens in bed', 'description': 'Screens stimulate your brain and delay drowsiness, making it harder to fall asleep.'},
        {'title': 'Don\'t read intense material in bed', 'description': 'Emotionally activating content delays wind-down and keeps your mind alert.'},
        {'title': 'Create a wind-down zone elsewhere', 'description': 'Having a separate space to relax reinforces bed = sleep.'},
      ],
      'bottomNote': 'Stimulus control is the most powerful CBT-I tool—your brain will learn this signal within weeks.'
    },
    '16': {
      'header': 'Get Out of Bed When You Can\'t Sleep',
      'subtitle': 'Leave the bed to save the bed-sleep association.',
      'tips': [
        {'title': 'If you can\'t sleep after about 20 minutes get up', 'description': 'Staying in bed awake weakens the sleep association. Break the cycle early.'},
        {'title': 'Do something calm in low light', 'description': 'Low stimulation lets sleep pressure rebuild while keeping you relaxed.'},
        {'title': 'Avoid checking the clock', 'description': 'Clock-watching increases stress and delays drowsiness.'},
        {'title': 'Return to bed only when sleepy', 'description': 'You want your brain to associate the bed with success not frustration.'},
      ],
      'bottomNote': 'The 20-minute rule protects your most valuable sleep tool—your bed-sleep connection.'
    },
    '17': {
      'header': 'Break the Scroll-Bed Link',
      'subtitle': 'Phones are sleep\'s biggest enemy—create physical distance.',
      'tips': [
        {'title': 'Keep your phone across the room at night', 'description': 'Physical separation reduces temptation and screen exposure.'},
        {'title': 'Use a non-phone alarm clock', 'description': 'Prevents late-night screen time and early-morning doomscrolling.'},
        {'title': 'Log your pre-bed habits', 'description': 'Awareness helps identify triggers that keep you stimulated at night.'},
        {'title': 'Replace scrolling with an offline habit like journaling', 'description': 'Gives your brain a low-stimulation signal that sleep is coming.'},
      ],
      'bottomNote': 'Move your phone—this single change helps more people than almost any other intervention.'
    },
    '18': {
      'header': 'No Judgment Nights',
      'subtitle': 'How you respond to a bad night matters more than the night itself.',
      'tips': [
        {'title': 'Don\'t label a sleepless night as failure', 'description': 'Sleep is a biological process; you can\'t force it. Shame increases anxiety.'},
        {'title': 'Reframe it as a reset', 'description': 'One night doesn\'t undo your progress. The next day is a new chance.'},
        {'title': 'Log how you responded to wakefulness', 'description': 'Your response matters more than the wake-up itself.'},
        {'title': 'Use supportive language in your journal', 'description': 'Kindness reduces stress and promotes recovery faster than criticism.'},
      ],
      'bottomNote': 'Self-compassion is part of CBT-I—one rough night doesn\'t erase your progress.'
    },
    '19': {
      'header': 'Evening Associations Matter',
      'subtitle': 'Consistency in your wind-down teaches your brain sleep is coming.',
      'tips': [
        {'title': 'Start your wind-down in the same place each night', 'description': 'Consistency cues your brain that sleep is near.'},
        {'title': 'Avoid stimulating rooms such as kitchen or workspace', 'description': 'Those spaces are linked to alertness and decision-making.'},
        {'title': 'Use the same scent, lighting, or sound each evening', 'description': 'Sensory cues help the brain automate its sleep mode.'},
        {'title': 'Wear consistent sleep clothes', 'description': 'Physical ritual reinforces sleep signals.'},
      ],
      'bottomNote': 'Environmental cues are powerful—your brain learns these signals and uses them to prepare for sleep.'
    },
    '20': {
      'header': 'Make Your Bed a Strong Cue',
      'subtitle': 'Only go to bed when you\'re truly ready to sleep.',
      'tips': [
        {'title': 'Only go to bed when truly sleepy', 'description': 'Entering bed drowsy helps condition your brain for fast sleep onset.'},
        {'title': 'Avoid lying in bed trying to sleep', 'description': 'Effort increases tension and delays natural sleep onset.'},
        {'title': 'Use the 20-minute rule consistently', 'description': 'Teaches your body the bed is not a place for wakefulness.'},
        {'title': 'Track how long it takes to fall asleep', 'description': 'Awareness helps identify progress and build confidence.'},
      ],
      'bottomNote': 'Sleep onset time improves dramatically when you only enter bed when drowsy—this change compounds daily.'
    },
    '21': {
      'header': 'Week in Review — Rewriting Bed Habits',
      'subtitle': 'You\'ve built a stronger sleep association than you realize.',
      'tips': [
        {'title': 'Reflect on which habits felt hardest', 'description': 'Identifying friction points helps you adjust and succeed next week.'},
        {'title': 'Celebrate even one change', 'description': 'One repeated behavior can shift your whole sleep pattern.'},
        {'title': 'List one thing that made your nights smoother', 'description': 'Small wins help shape your sleep identity.'},
        {'title': 'Preview next week\'s focus: Thought Shifts', 'description': 'Behavioral change sets the stage for cognitive improvements.'},
      ],
      'bottomNote': 'You\'ve rewired your bed—next week you\'ll rewire your thoughts about sleep.'
    },

    // Week 4: Cognitive Restructuring (Days 22-28)
    '22': {
      'header': 'What You Think About Sleep Shapes How You Sleep',
      'subtitle': 'Your thoughts create your reality—and your sleep.',
      'tips': [
        {'title': 'Notice recurring thoughts about your sleep', 'description': 'Unhelpful beliefs like "I\'ll never fall asleep" increase anxiety and become self-fulfilling.'},
        {'title': 'Keep a simple thought log before bed', 'description': 'Writing down recurring worries reduces their mental load and helps create distance.'},
        {'title': 'Label thoughts as helpful or unhelpful', 'description': 'Cognitive restructuring starts by identifying whether a thought supports your goal.'},
        {'title': 'Don\'t try to force positive thinking', 'description': 'The goal is realistic, supportive thoughts, not fake optimism.'},
      ],
      'bottomNote': 'Your thoughts about sleep are learnable—this week, you\'ll learn new ones that support rest.'
    },
    '23': {
      'header': 'Catch the Thought, Don\'t Fight It',
      'subtitle': 'Arguing with anxiety makes it stronger—curiosity defuses it.',
      'tips': [
        {'title': 'Use a neutral tone with your thoughts', 'description': 'Arguing with negative thoughts strengthens them. Curiosity defuses them.'},
        {'title': 'Practice saying "I\'m noticing the thought..."', 'description': 'Creates space between you and the thought so it does not define your identity.'},
        {'title': 'Don\'t analyze thoughts in bed', 'description': 'Overthinking activates the brain and delays sleep.'},
        {'title': 'Pair a thought log with relaxing rituals', 'description': 'This helps release the thought without clinging to it.'},
      ],
      'bottomNote': 'Distance from your thoughts is the key—you don\'t have to believe every worried whisper in your head.'
    },
    '24': {
      'header': 'Common Sleep Myths That Cause Harm',
      'subtitle': 'These beliefs are quietly wrecking your sleep—let\'s bust them.',
      'tips': [
        {'title': '"I need 8 hours or I\'ll crash"', 'description': 'Sleep needs vary. Believing this rigid rule increases pressure and panic.'},
        {'title': '"If I wake up at night something\'s wrong"', 'description': 'Waking briefly is normal. Stressing over it turns a harmless event into a problem.'},
        {'title': '"I can\'t function unless I sleep perfectly"', 'description': 'Sleep resilience is real. You can do well even after a poor night.'},
        {'title': 'Replace myths with flexible truths', 'description': 'Adaptive thinking creates psychological safety, essential for better sleep.'},
      ],
      'bottomNote': 'These myths are surprisingly common—once you see them, you can replace them with realistic truths.'
    },
    '25': {
      'header': 'Replace Fear with Realism',
      'subtitle': 'Use evidence from your own life to counter catastrophic thoughts.',
      'tips': [
        {'title': 'Use evidence from past nights', 'description': 'Real data from your own sleep helps counter catastrophic thoughts.'},
        {'title': 'Notice what you got done even after poor sleep', 'description': 'This reinforces your resilience and reduces helplessness.'},
        {'title': 'Avoid all-or-nothing thinking', 'description': 'Sleep is not binary; you can rest even without deep sleep.'},
        {'title': 'Practice gentle reframing', 'description': 'Shifting from fear to neutrality calms the nervous system.'},
      ],
      'bottomNote': 'You\'re more resilient than you think—your sleep logs prove it.'
    },
    '26': {
      'header': 'Your Sleep Thoughts Aren\'t Always True',
      'subtitle': 'Test your worries like a scientist, not a victim.',
      'tips': [
        {'title': 'Thought does not equal fact', 'description': 'The brain often produces fear-based thoughts that feel urgent but are not accurate.'},
        {'title': 'Test the thought like a scientist', 'description': 'Challenge exaggerated sleep fears with logic and observation.'},
        {'title': 'Use sleep logs to verify or disprove fears', 'description': 'Data reduces the emotional charge behind distorted beliefs.'},
        {'title': 'Say: "Is this helpful or is it just noise?"', 'description': 'Separating useful insights from mental noise prevents spiraling.'},
      ],
      'bottomNote': 'Most nighttime worries are noise—learning to spot the difference will free you.'
    },
    '27': {
      'header': 'You\'re Allowed to Sleep Badly Sometimes',
      'subtitle': 'Permission to be imperfect is permission to heal.',
      'tips': [
        {'title': 'Give yourself permission to have off nights', 'description': 'Perfectionism around sleep increases pressure and backfires.'},
        {'title': 'Reframe: "It\'s okay if tonight isn\'t perfect"', 'description': 'Acceptance reduces sleep anxiety and restores flexibility.'},
        {'title': 'Track sleep effort not just outcomes', 'description': 'Showing up for routines matters more than perfect sleep stats.'},
        {'title': 'Use your journal to release guilt', 'description': 'Expressive writing clears tension and promotes self-kindness.'},
      ],
      'bottomNote': 'Perfectionism kills sleep—self-compassion heals it. Give yourself permission.'
    },
    '28': {
      'header': 'Week in Review — Thoughts Drive Sleep',
      'subtitle': 'You\'ve rewired your mind—notice how different you feel.',
      'tips': [
        {'title': 'Reflect on which beliefs helped or hurt', 'description': 'Insight builds awareness, which leads to more helpful thought patterns.'},
        {'title': 'Circle your one biggest thought shift this week', 'description': 'Naming it locks in the learning.'},
        {'title': 'Keep a helpful thoughts list in your journal', 'description': 'Repeating supportive beliefs strengthens the brain\'s new response.'},
        {'title': 'Notice how you feel when thinking these new thoughts', 'description': 'CBT-I works by pairing new thoughts with safety and calm.'},
      ],
      'bottomNote': 'Your thoughts shaped your sleep patterns—now you\'re shaping them back. This is real power.'
    },

    // Week 5: Wind Down Rituals (Days 29-35)
    '29': {
      'header': 'Why You Need a Wind-Down Ritual',
      'subtitle': 'Build a short, repeatable ritual that signals your brain it’s time to rest.',
      'tips': [
        {
          'title': 'Start earlier',
          'description': 'Begin your ritual 30–60 minutes before bed; the small buffer helps your brain shift toward rest.'
        },
        {
          'title': 'Keep it short',
          'description': 'Even 5 minutes of consistent steps can create a powerful cue over time.'
        },
        {
          'title': 'Repeat the steps',
          'description': 'Doing the same actions nightly builds a strong sleep association.'
        },
        {
          'title': 'Avoid screens',
          'description': 'Blue light and stimulating content interfere with melatonin and delay sleep.'
        },
      ],
      'bottomNote': 'A tiny nightly ritual creates consistent signals your brain can learn — start with one easy step.'
    },
    '30': {
      'header': 'Breathe to Slow the Mind',
      'subtitle': 'Simple breath patterns reduce alertness and prepare the nervous system for sleep.',
      'tips': [
        {'title': 'Try 4-7-8', 'description': 'Inhale 4s, hold 7s, exhale 8s. Do 3–5 rounds with no pressure.'},
        {'title': 'Use soft sound', 'description': 'Quiet background sounds can mask intrusive thoughts and support calm.'},
        {'title': 'Pair with dim light', 'description': 'Breathing works best when your environment also signals rest.'},
      ],
      'bottomNote': 'Breathing is portable — it works anywhere and reduces nighttime arousal quickly.'
    },
    '31': {
      'header': 'Light Stretching for Stillness',
      'subtitle': 'Gentle movement releases physical tension without raising alertness.',
      'tips': [
        {'title': 'Stretch gently', 'description': 'Focus on neck, shoulders, and legs for 15–30 seconds each.'},
        {'title': 'Low effort only', 'description': 'Avoid energizing moves; keep the routine calming and slow.'},
        {'title': 'Do it in low light', 'description': 'The environment reinforces your wind-down signal.'},
      ],
      'bottomNote': 'Small stretches ease the body and make rest more likely — keep them brief and regular.'
    },
    '32': {
      'header': 'Let It Go With One Sentence',
      'subtitle': 'A short journaling ritual that offloads worry and clears mental space for sleep.',
      'tips': [
        {'title': 'One sentence', 'description': 'Write: "Tonight I let go of…" — simple, judgment-free, fast.'},
        {'title': 'Keep a notebook handy', 'description': 'Paper reduces screen exposure and increases follow-through.'},
        {'title': 'Pair with a calming phrase', 'description': 'Finish with a supportive line like "I’ve done enough for today."'},
      ],
      'bottomNote': 'This quick ritual reduces rumination and often short-circuits bedtime worry.'
    },
    '33': {
      'header': 'Create a "Sleep-Only" Zone',
      'subtitle': 'Strengthen the bed–sleep association by reserving your bed for rest only.',
      'tips': [
        {'title': 'Remove non-sleep activities', 'description': 'Avoid work, eating, and prolonged phone use in bed.'},
        {'title': 'Leave bed after 20 minutes', 'description': 'If you’re awake, do a calm activity and return only when sleepy.'},
        {'title': 'Keep the environment consistent', 'description': 'Same cues nightly make sleep come easier.'},
      ],
      'bottomNote': 'A strong bed-only rule helps retrain your brain and reduces conditioned arousal.'
    },
    '34': {
      'header': 'Use Senses to Signal Calm',
      'subtitle': 'Scent, texture, sound and light can become powerful wind-down cues when used consistently.',
      'tips': [
        {'title': 'Try calming scents', 'description': 'Lavender or similar scents can become reliable relaxation cues.'},
        {'title': 'Choose soft textures', 'description': 'Comfortable bedding supports physical relaxation.'},
        {'title': 'Lower sound stimulation', 'description': 'Use earplugs or soft audio to remove disruptive noises.'},
      ],
      'bottomNote': 'Pick a few sensory cues you like and pair them nightly to build strong associations.'
    },
    '35': {
      'header': 'Make It Yours',
      'subtitle': 'Pick the few routines you enjoy and repeat them nightly to create a sustainable ritual.',
      'tips': [
        {'title': 'Choose favorites', 'description': 'Select 2–3 practices you actually want to keep.'},
        {'title': 'Stick to an order', 'description': 'Consistent sequence makes the routine automatic.'},
        {'title': 'Name your ritual', 'description': 'Giving it a name increases ownership and follow-through.'},
      ],
      'bottomNote': 'Personal rituals are more likely to stick—start small and be consistent.'
    },

    // Week 6: Tackle Awakenings (Days 36-42)
    '36': {
      'header': 'Night Waking Is Normal',
      'subtitle': 'Brief awakenings are part of healthy sleep; panic makes them worse.',
      'tips': [
        {'title': 'Expect brief wakes', 'description': '1–2 short awakenings are common and not harmful.'},
        {'title': 'Avoid clock-watching', 'description': 'Checking the time increases alertness and frustration.'},
        {'title': 'Stay relaxed', 'description': 'Resting calmly still supports physical recovery.'},
      ],
      'bottomNote': 'Accepting small awakenings reduces anxiety and supports better overall sleep.'
    },
    '37': {
      'header': 'What to Do When You Can’t Sleep',
      'subtitle': 'If you’re awake for 20+ minutes, get up and do a calm, low-light activity.',
      'tips': [
        {'title': 'Get up after ~20 minutes', 'description': 'Avoid staying in bed alert; change location briefly.'},
        {'title': 'Do something calm', 'description': 'Light reading or stretching helps reset without stimulation.'},
        {'title': 'Return when drowsy', 'description': 'Only go back when you feel sleepy again.'},
      ],
      'bottomNote': 'This strategy breaks negative bed associations and helps you fall asleep faster over time.'
    },
    '38': {
      'header': 'Your Body Still Gets Rest',
      'subtitle': 'Quiet wakefulness can still support restorative processes—don’t panic if you’re not immediately asleep.',
      'tips': [
        {'title': 'Reframe wakefulness', 'description': 'Accepting rest, even without sleep, reduces arousal.'},
        {'title': 'Try breathing or body scan', 'description': 'These techniques encourage the nervous system to calm down.'},
        {'title': 'Count breaths or scan body', 'description': 'Anchoring attention reduces mental noise.'},
      ],
      'bottomNote': 'Resting calmly is beneficial even when sleep doesn’t come immediately.'
    },
    '39': {
      'header': 'Don\'t Make the Bed the Enemy',
      'subtitle': 'Avoid negative emotions in bed; they create anxious associations that worsen sleep.',
      'tips': [
        {'title': 'Change location briefly', 'description': 'If you feel tense, get up and do something calming before returning to bed.'},
        {'title': 'Use neutral self-talk', 'description': 'Phrases like "this is temporary" lower cortisol and tension.'},
        {'title': 'Return when calm', 'description': 'Go back to bed only when you feel relaxed.'},
      ],
      'bottomNote': 'Breaking the cycle of tension in bed helps rebuild a safe sleep association.'
    },
    '40': {
      'header': 'Let Go of the Chase',
      'subtitle': 'Trying hard to sleep often backfires—shift to rest rather than performance.',
      'tips': [
        {'title': 'Adopt a rest mindset', 'description': 'Letting go of pressure helps sleep come naturally.'},
        {'title': 'Try gentle visualization', 'description': 'Soft mental images steer attention away from performance anxiety.'},
        {'title': 'Stop tracking time awake', 'description': 'Time pressure raises arousal and delays sleep return.'},
      ],
      'bottomNote': 'Reducing performance pressure is central to returning to sleep more easily.'
    },
    '41': {
      'header': 'Build Your Midnight Toolkit',
      'subtitle': 'Prepare a few calming tools you can use during wake-ups so decisions are easier at night.',
      'tips': [
        {'title': 'List calming activities', 'description': 'Examples: body scan, breathing, light stretching.'},
        {'title': 'Keep tools nearby', 'description': 'Eye mask, notebook, or soft music reduce friction.'},
        {'title': 'Practice during the day', 'description': 'Familiarity with tools makes them more effective at night.'},
      ],
      'bottomNote': 'A prepared toolkit prevents panic and makes calm actions automatic.'
    },
    '42': {
      'header': 'Your Sleep Confidence Plan',
      'subtitle': 'Reflect on progress and set a simple go-to plan for future awakenings.',
      'tips': [
        {'title': 'Reflect on what helped', 'description': 'List the most effective strategies from the week.'},
        {'title': 'Accept occasional wake-ups', 'description': 'Confidence comes from your response, not elimination of awakenings.'},
        {'title': 'Set a go-to plan', 'description': 'Have clarity on the steps you’ll use next time.'},
      ],
      'bottomNote': 'Confidence grows when you know how you’ll respond — plan and rehearse your approach.'
    },

    // Week 7: Review & Reinforce (Days 43-49)
    '43': {
      'header': 'Your Sleep, Then vs. Now',
      'subtitle': 'Compare your early logs with recent ones to see measurable progress.',
      'tips': [
        {'title': 'Compare first vs recent logs', 'description': 'Look for patterns and improvements over time.'},
        {'title': 'Notice emotional change', 'description': 'Improvements in mood and routine matter, not just hours slept.'},
        {'title': 'Celebrate consistency', 'description': 'Recognize behaviors you stuck with as meaningful wins.'},
      ],
      'bottomNote': 'Seeing measurable change reinforces motivation and highlights what worked.'
    },
    '44': {
      'header': 'Keep What Worked',
      'subtitle': 'Select 2–3 core habits to continue — narrow focus improves maintenance.',
      'tips': [
        {'title': 'Pick 2–3 habits', 'description': 'Narrow focus makes long-term maintenance realistic.'},
        {'title': 'Write them down', 'description': 'A visible "sleep card" anchors the choices.'},
        {'title': 'Make them non-negotiable', 'description': 'Treat them as fallback routines on tough days.'},
      ],
      'bottomNote': 'Keeping a short list of high-impact habits increases the chance you’ll maintain them.'
    },
    '45': {
      'header': 'Drop What Didn\'t Work',
      'subtitle': 'Let go of strategies that caused stress or weren’t sustainable.',
      'tips': [
        {'title': 'Be flexible', 'description': 'If something felt stressful, it’s okay to stop it.'},
        {'title': 'Replace with natural options', 'description': 'Choose replacements that feel easy to repeat.'},
        {'title': 'Embrace trial and error', 'description': 'Learning what not to do is part of finding what works.'},
      ],
      'bottomNote': 'Dropping ineffective or aversive practices frees space for sustainable habits.'
    },
    '46': {
      'header': 'Your Sleep Identity',
      'subtitle': 'Shift your self-view toward someone who prioritizes rest — identity supports long-term behavior.',
      'tips': [
        {'title': 'Adopt supportive self-talk', 'description': 'Use phrases like "I take care of my sleep now."'},
        {'title': 'Avoid defining by insomnia', 'description': 'Labels can limit growth; focus on what you can do.'},
        {'title': 'Track self-awareness gains', 'description': 'Notice emotional and behavioral changes over time.'},
      ],
      'bottomNote': 'Identity-based changes are more resilient than sheer willpower.'
    },
    '47': {
      'header': 'Reinforce with Reflection',
      'subtitle': 'Take a few minutes to journal wins, setbacks, and surprises from your CBT-I journey.',
      'tips': [
        {'title': 'Journal 3–5 minutes', 'description': 'List biggest wins, toughest moments, and surprises.'},
        {'title': 'Review coping tools', 'description': 'Keep favorites top of mind for future rough patches.'},
        {'title': 'Acknowledge effort', 'description': 'Self-validation builds confidence and strengthens habits.'},
      ],
      'bottomNote': 'Reflection consolidates learning and helps you choose which habits to carry forward.'
    },
    '48': {
      'header': 'Plan for Setbacks',
      'subtitle': 'Decide now how you’ll respond to occasional poor nights — pre-planning prevents panic.',
      'tips': [
        {'title': 'Expect occasional poor nights', 'description': 'They are normal and temporary.'},
        {'title': 'Create a recovery plan', 'description': 'Decide concrete steps you’ll take if sleep worsens.'},
        {'title': 'Use compassion tokens', 'description': 'Allow yourself guilt-free resets so you don’t quit.'},
      ],
      'bottomNote': 'A clear recovery plan reduces anxiety and preserves long-term progress.'
    },
    '49': {
      'header': 'This Is the Start of Ownership',
      'subtitle': 'You now have a system — trust your tools and check in weekly to sustain change.',
      'tips': [
        {'title': 'Trust your tools', 'description': 'Reliance on skills, not the app, builds independence.'},
        {'title': 'Check in weekly', 'description': 'Regular reflection helps you sustain and adapt.'},
        {'title': 'Teach others', 'description': 'Sharing what you learned reinforces mastery.'},
      ],
      'bottomNote': 'This program’s end is the start of long-term self-care — keep the essentials and adapt as needed.'
    },
  };

  static Map<String, dynamic>? getArticleForDay(String day) {
    return articles[day];
  }
}
