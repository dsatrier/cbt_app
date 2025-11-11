import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_drive/pages/first_page.dart';

class OnboardingForm extends StatefulWidget {
  const OnboardingForm({super.key});

  @override
  State<OnboardingForm> createState() => _OnboardingFormState();
}

class _OnboardingFormState extends State<OnboardingForm> {
  static const Color primaryColor = Color(0xFF93679D);
  static const Color accentColor = Color(0xFFA995AE);
  static const Color backgroundColor = Color(0xFFEBEAE2);

  int currentSection = 0;
  final PageController _pageController = PageController();

  // Section 1: About You
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _gender;
  final TextEditingController _genderOtherController = TextEditingController();
  String? _occupation;
  final TextEditingController _occupationOtherController = TextEditingController();

  // Section 2: Your Goals
  String? _mainGoal;
  final TextEditingController _mainGoalOtherController = TextEditingController();
  double _importance = 5.0;
  String? _resultsTimeline;
  final TextEditingController _frustrationController = TextEditingController();

  // Section 3: Sleep Schedule & Quality
  TimeOfDay? _bedtime;
  TimeOfDay? _wakeTime;
  String? _sleepDuration;
  final TextEditingController _sleepDurationOtherController = TextEditingController();
  String? _sleepQuality;
  String? _fallAsleepTime;
  String? _nightWakings;
  String? _feelingRested;
  String? _daytimeSleepiness;
  String? _sleepAids;
  final TextEditingController _sleepAidsOtherController = TextEditingController();

  // Section 4: Sleep Barriers & Health
  final Set<String> _sleepIssues = {};
  final TextEditingController _sleepIssuesOtherController = TextEditingController();
  String? _sleepDisorder;
  final TextEditingController _sleepDisorderOtherController = TextEditingController();
  final Set<String> _healthConditions = {};
  final TextEditingController _healthConditionsOtherController = TextEditingController();
  final TextEditingController _medicationsController = TextEditingController();

  // Section 5: Lifestyle
  String? _physicalActivity;
  final TextEditingController _physicalActivityOtherController = TextEditingController();
  String? _activityType;
  final TextEditingController _activityTypeOtherController = TextEditingController();
  String? _dietPattern;
  final TextEditingController _dietPatternOtherController = TextEditingController();

  // Section 6: Habits & Tech Use
  String? _caffeineIntake;
  final TextEditingController _caffeineOtherController = TextEditingController();
  String? _alcoholUse;
  final TextEditingController _alcoholOtherController = TextEditingController();
  String? _nicotineUse;
  final TextEditingController _nicotineOtherController = TextEditingController();
  String? _screenTime;
  final TextEditingController _screenTimeOtherController = TextEditingController();
  String? _phoneBeforeBed;
  final TextEditingController _phoneBeforeBedOtherController = TextEditingController();
  String? _blueLightFilter;
  final TextEditingController _blueLightFilterOtherController = TextEditingController();

  // Section 7: Delivery Preferences
  final Set<String> _preferredFormat = {};
  final TextEditingController _preferredFormatOtherController = TextEditingController();
  String? _preferredFrequency;
  final TextEditingController _preferredFrequencyOtherController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _genderOtherController.dispose();
    _occupationOtherController.dispose();
    _mainGoalOtherController.dispose();
    _frustrationController.dispose();
    _sleepDurationOtherController.dispose();
    _sleepAidsOtherController.dispose();
    _sleepIssuesOtherController.dispose();
    _sleepDisorderOtherController.dispose();
    _healthConditionsOtherController.dispose();
    _medicationsController.dispose();
    _physicalActivityOtherController.dispose();
    _activityTypeOtherController.dispose();
    _dietPatternOtherController.dispose();
    _caffeineOtherController.dispose();
    _alcoholOtherController.dispose();
    _nicotineOtherController.dispose();
    _screenTimeOtherController.dispose();
    _phoneBeforeBedOtherController.dispose();
    _blueLightFilterOtherController.dispose();
    _preferredFormatOtherController.dispose();
    _preferredFrequencyOtherController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboarding() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final prefs = await SharedPreferences.getInstance();
      
      // Save all data
      await prefs.setString('userName', _nameController.text.trim());
      await prefs.setString('userAge', _ageController.text.trim());
      await prefs.setString('userGender', _gender ?? '');
      await prefs.setString('userOccupation', _occupation ?? '');
      await prefs.setString('mainGoal', _mainGoal ?? '');
      await prefs.setDouble('goalImportance', _importance);
      await prefs.setString('resultsTimeline', _resultsTimeline ?? '');
      await prefs.setString('biggestFrustration', _frustrationController.text.trim());
      
      // Save times as strings
      if (_bedtime != null) {
        await prefs.setString('bedtime', '${_bedtime!.hour}:${_bedtime!.minute}');
      }
      if (_wakeTime != null) {
        await prefs.setString('wakeTime', '${_wakeTime!.hour}:${_wakeTime!.minute}');
      }
      
      await prefs.setString('sleepDuration', _sleepDuration ?? '');
      await prefs.setString('sleepQuality', _sleepQuality ?? '');
      await prefs.setString('fallAsleepTime', _fallAsleepTime ?? '');
      await prefs.setString('nightWakings', _nightWakings ?? '');
      await prefs.setString('feelingRested', _feelingRested ?? '');
      await prefs.setString('daytimeSleepiness', _daytimeSleepiness ?? '');
      await prefs.setString('sleepAids', _sleepAids ?? '');
      
      await prefs.setStringList('sleepIssues', _sleepIssues.toList());
      await prefs.setString('sleepDisorder', _sleepDisorder ?? '');
      await prefs.setStringList('healthConditions', _healthConditions.toList());
      await prefs.setString('medications', _medicationsController.text.trim());
      
      await prefs.setString('physicalActivity', _physicalActivity ?? '');
      await prefs.setString('activityType', _activityType ?? '');
      await prefs.setString('dietPattern', _dietPattern ?? '');
      
      await prefs.setString('caffeineIntake', _caffeineIntake ?? '');
      await prefs.setString('alcoholUse', _alcoholUse ?? '');
      await prefs.setString('nicotineUse', _nicotineUse ?? '');
      await prefs.setString('screenTime', _screenTime ?? '');
      await prefs.setString('phoneBeforeBed', _phoneBeforeBed ?? '');
      await prefs.setString('blueLightFilter', _blueLightFilter ?? '');
      
      await prefs.setStringList('preferredFormat', _preferredFormat.toList());
      await prefs.setString('preferredFrequency', _preferredFrequency ?? '');
      
      await prefs.setBool('hasCompletedOnboarding', true);

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const FirstPage(),
          ),
        );
      }
    }
  }

  void _nextSection() {
    if (currentSection < 6) {
      setState(() {
        currentSection++;
      });
      _pageController.animateToPage(
        currentSection,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _completeOnboarding();
    }
  }

  void _previousSection() {
    if (currentSection > 0) {
      setState(() {
        currentSection--;
      });
      _pageController.animateToPage(
        currentSection,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _selectTime(BuildContext context, bool isBedtime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isBedtime) {
          _bedtime = picked;
        } else {
          _wakeTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Welcome',
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (currentSection + 1) / 7,
              backgroundColor: Colors.grey[300],
              color: primaryColor,
              minHeight: 8,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildSection1(),
                  _buildSection2(),
                  _buildSection3(),
                  _buildSection4(),
                  _buildSection5(),
                  _buildSection6(),
                  _buildSection7(),
                ],
              ),
            ),
            _buildNavigationButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 1: About You',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Name', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            validator: (value) => value?.isEmpty ?? true ? 'Please enter your name' : null,
          ),
          const SizedBox(height: 16),
          
          Text('Age', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter your age',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Text('Gender (Optional)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Male', 'Female', 'Non-binary', 'Prefer not to say', 'Other'],
            _gender,
            (value) => setState(() => _gender = value),
            _genderOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Occupation/Status', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Student', 'Full-time', 'Part-time', 'Freelancer', 'None', 'Other'],
            _occupation,
            (value) => setState(() => _occupation = value),
            _occupationOtherController,
          ),
        ],
      ),
    );
  }

  Widget _buildSection2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 2: Your Goals',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Main Goal for Joining', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            [
              'Fall asleep faster',
              'Sleep through the night',
              'Wake up feeling rested',
              'Reduce stress/anxiety around sleep',
              'Build a consistent bedtime routine',
              'Other'
            ],
            _mainGoal,
            (value) => setState(() => _mainGoal = value),
            _mainGoalOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('How Important is This to You?', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Slider(
                  value: _importance,
                  min: 1,
                  max: 10,
                  divisions: 9,
                  activeColor: primaryColor,
                  label: _importance.round().toString(),
                  onChanged: (value) => setState(() => _importance = value),
                ),
              ),
              Text(
                '${_importance.round()}',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Text('How Quickly Do You Want Results?', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Within a week', 'Within a month', 'Gradually'],
            _resultsTimeline,
            (value) => setState(() => _resultsTimeline = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('Biggest Sleep Frustration', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _frustrationController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Describe your biggest frustration...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 3: Sleep Schedule & Quality',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Usual Bedtime', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectTime(context, true),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _bedtime != null ? _bedtime!.format(context) : 'Select time',
                    style: GoogleFonts.poppins(),
                  ),
                  const Icon(Icons.access_time),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Text('Usual Wake-up Time', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => _selectTime(context, false),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _wakeTime != null ? _wakeTime!.format(context) : 'Select time',
                    style: GoogleFonts.poppins(),
                  ),
                  const Icon(Icons.access_time),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          
          Text('Average Sleep Duration', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['< 5h', '5–6h', '6–7h', '7–8h', '> 8h', 'Other'],
            _sleepDuration,
            (value) => setState(() => _sleepDuration = value),
            _sleepDurationOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Overall Sleep Quality', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Very poor', 'Poor', 'Fair', 'Good', 'Excellent'],
            _sleepQuality,
            (value) => setState(() => _sleepQuality = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('How Long It Takes to Fall Asleep', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['< 15 min', '15–30 min', '30–60 min', '> 60 min'],
            _fallAsleepTime,
            (value) => setState(() => _fallAsleepTime = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('Night Wakings', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Never', '1–2 times', '3+ times'],
            _nightWakings,
            (value) => setState(() => _nightWakings = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('Feeling Rested on Waking', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Never', 'Sometimes', 'Often', 'Always'],
            _feelingRested,
            (value) => setState(() => _feelingRested = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('Daytime Sleepiness', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['None', 'Mild', 'Moderate', 'Severe'],
            _daytimeSleepiness,
            (value) => setState(() => _daytimeSleepiness = value),
            null,
          ),
          const SizedBox(height: 16),
          
          Text('Use of Sleep Aids', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['None', 'Occasionally', 'Frequently', 'Other'],
            _sleepAids,
            (value) => setState(() => _sleepAids = value),
            _sleepAidsOtherController,
          ),
        ],
      ),
    );
  }

  Widget _buildSection4() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 4: Sleep Barriers & Health',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Main Sleep Issues (Select all)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildCheckboxGroup(
            [
              'Trouble falling asleep',
              'Waking often',
              'Waking too early',
              'Racing thoughts',
              'Noise/light issues',
              'Uncomfortable setup',
              'None',
              'Other'
            ],
            _sleepIssues,
            _sleepIssuesOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Diagnosed Sleep Disorders', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            [
              'None',
              'Insomnia',
              'Sleep Apnea',
              'Restless Leg Syndrome',
              'Narcolepsy',
              'Circadian Rhythm Disorder',
              'Other'
            ],
            _sleepDisorder,
            (value) => setState(() => _sleepDisorder = value),
            _sleepDisorderOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Health Conditions (Select all)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildCheckboxGroup(
            [
              'None',
              'Anxiety',
              'Depression',
              'ADHD',
              'Diabetes',
              'Thyroid issues',
              'Chronic pain',
              'Cardiovascular issues',
              'Other'
            ],
            _healthConditions,
            _healthConditionsOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Current Medications (Optional)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _medicationsController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: 'List any medications...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection5() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 5: Lifestyle',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Physical Activity (Days per Week)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['None', '1–2', '3–4', '5+', 'Other'],
            _physicalActivity,
            (value) => setState(() => _physicalActivity = value),
            _physicalActivityOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Type of Activity', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Walking', 'Gym/Strength', 'Yoga', 'Sports', 'None', 'Other'],
            _activityType,
            (value) => setState(() => _activityType = value),
            _activityTypeOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Diet Pattern', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Regular meals', 'Skips meals', 'Late-night snacking', 'None', 'Other'],
            _dietPattern,
            (value) => setState(() => _dietPattern = value),
            _dietPatternOtherController,
          ),
        ],
      ),
    );
  }

  Widget _buildSection6() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 6: Habits & Tech Use',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Caffeine Intake', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['None', '1 cup', '2–3 cups', '4+ cups', 'Other'],
            _caffeineIntake,
            (value) => setState(() => _caffeineIntake = value),
            _caffeineOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Alcohol Use', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Never', 'Occasionally', 'Frequently', 'Other'],
            _alcoholUse,
            (value) => setState(() => _alcoholUse = value),
            _alcoholOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Nicotine Use', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Never', 'Occasionally', 'Daily', 'Other'],
            _nicotineUse,
            (value) => setState(() => _nicotineUse = value),
            _nicotineOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Average Daily Screen Time', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['< 3h', '3–5h', '5–7h', '7+', 'Other'],
            _screenTime,
            (value) => setState(() => _screenTime = value),
            _screenTimeOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Phone Use Before Bed', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Yes', 'No', 'Other'],
            _phoneBeforeBed,
            (value) => setState(() => _phoneBeforeBed = value),
            _phoneBeforeBedOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Blue-Light Filter Usage', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Always', 'Sometimes', 'Never', 'Other'],
            _blueLightFilter,
            (value) => setState(() => _blueLightFilter = value),
            _blueLightFilterOtherController,
          ),
        ],
      ),
    );
  }

  Widget _buildSection7() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Section 7: Delivery Preferences',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          Text('Preferred Format (Select all)', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildCheckboxGroup(
            [
              'Articles/Blogs',
              'Push Notifications',
              'Email Updates',
              'In-app Reminders',
              'None',
              'Other'
            ],
            _preferredFormat,
            _preferredFormatOtherController,
          ),
          const SizedBox(height: 16),
          
          Text('Preferred Frequency', style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          ..._buildRadioGroup(
            ['Daily', 'Weekly', 'Only when necessary', 'None', 'Other'],
            _preferredFrequency,
            (value) => setState(() => _preferredFrequency = value),
            _preferredFrequencyOtherController,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRadioGroup(
    List<String> options,
    String? groupValue,
    Function(String?) onChanged,
    TextEditingController? otherController,
  ) {
    return options.map((option) {
      final isOther = option == 'Other';
      return Column(
        children: [
          RadioListTile<String>(
            title: Text(option, style: GoogleFonts.poppins()),
            value: option,
            groupValue: groupValue,
            activeColor: primaryColor,
            onChanged: onChanged,
            contentPadding: EdgeInsets.zero,
          ),
          if (isOther && groupValue == 'Other' && otherController != null)
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 8),
              child: TextFormField(
                controller: otherController,
                decoration: InputDecoration(
                  hintText: 'Please specify...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
        ],
      );
    }).toList();
  }

  List<Widget> _buildCheckboxGroup(
    List<String> options,
    Set<String> groupValue,
    TextEditingController? otherController,
  ) {
    return options.map((option) {
      final isOther = option == 'Other';
      return Column(
        children: [
          CheckboxListTile(
            title: Text(option, style: GoogleFonts.poppins()),
            value: groupValue.contains(option),
            activeColor: primaryColor,
            onChanged: (checked) {
              setState(() {
                if (checked == true) {
                  groupValue.add(option);
                } else {
                  groupValue.remove(option);
                }
              });
            },
            contentPadding: EdgeInsets.zero,
          ),
          if (isOther && groupValue.contains('Other') && otherController != null)
            Padding(
              padding: const EdgeInsets.only(left: 32, bottom: 8),
              child: TextFormField(
                controller: otherController,
                decoration: InputDecoration(
                  hintText: 'Please specify...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
              ),
            ),
        ],
      );
    }).toList();
  }

  Widget _buildNavigationButtons() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (currentSection > 0)
            TextButton.icon(
              onPressed: _previousSection,
              icon: const Icon(Icons.arrow_back),
              label: Text('Back', style: GoogleFonts.poppins()),
              style: TextButton.styleFrom(
                foregroundColor: primaryColor,
              ),
            )
          else
            const SizedBox(),
          
          ElevatedButton(
            onPressed: _isLoading ? null : _nextSection,
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    currentSection < 6 ? 'Next' : 'Complete',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}