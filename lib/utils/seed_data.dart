import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

/// Helper to seed sleep diary entries for testing.
/// Run this once in main.dart or call it from a debug button.
Future<void> seedSleepDiaryData() async {
  final prefs = await SharedPreferences.getInstance();

  // Generate 20 sample sleep entries (past 20 days) with realistic ups and downs
  final List<Map<String, String>> entries = [];
  
  final now = DateTime.now();
  
  // Create a pattern with realistic fluctuations (ups and downs) averaging ~8 hours
  final sleepDurations = [
    6.5, 7.0, 7.5, 8.2, 7.8, 8.5, 7.2, 8.0, 8.3, 6.8, // Days 1-10
    8.1, 7.9, 8.4, 7.3, 8.6, 8.0, 7.5, 8.2, 8.1, 8.0, // Days 11-20
  ];
  
  // Quality ratings with variation
  final qualities = [
    2, 3, 3, 4, 4, 4, 3, 3, 5, 2, // Days 1-10
    4, 3, 5, 3, 5, 4, 3, 4, 4, 4, // Days 11-20
  ];
  
  for (int i = 19; i >= 0; i--) {
    final date = now.subtract(Duration(days: i));
    final dateStr = date.toIso8601String().substring(0, 10);
    
    final dayIndex = 19 - i; // 0 to 19
    final duration = sleepDurations[dayIndex];
    final quality = qualities[dayIndex].toString();
    
    // Bedtime: varied around 11 PM - 12:30 AM
    final bedMinute = (dayIndex * 17) % 60;
    final bedtime = '11:${bedMinute.toString().padLeft(2, '0')} PM';
    
    // Wake time: calculated from sleep duration (roughly 7-8:30 AM range)
    final sleepHours = duration.toInt();
    final sleepMins = ((duration - sleepHours) * 60).toInt();
    final totalMinutes = sleepHours * 60 + sleepMins;
    final wakeMinutes = (23 * 60 + bedMinute + totalMinutes); // 23:bedMinute + duration
    final wakeHourCalc = (wakeMinutes ~/ 60) % 24;
    final wakeMinuteCalc = wakeMinutes % 60;
    
    // Convert to 12-hour format
    final wakePeriod = wakeHourCalc >= 12 ? 'PM' : 'AM';
    final displayWakeHour = wakeHourCalc > 12 ? wakeHourCalc - 12 : (wakeHourCalc == 0 ? 12 : wakeHourCalc);
    final waketime = '$displayWakeHour:${wakeMinuteCalc.toString().padLeft(2, '0')} $wakePeriod';
    
    // Sleep latency: varies 5-25 minutes
    final latency = (5 + (dayIndex * 11) % 21).toString();
    
    // Awakenings: varies 0-2
    final awakenings = (dayIndex % 3).toString();
    
    // Stimulants: occasional yes/no
    final stimulants = (dayIndex % 4 == 0) ? 'Yes' : 'No';
    
    // Reflections based on quality and duration
    final reflections = [
      'Struggled to sleep.',
      'Restless night.',
      'Decent sleep.',
      'Good night overall.',
      'Excellent sleep!',
      'Very refreshed.',
      'Woke up tired.',
      'Mixed night.',
      'Better than expected.',
      'Solid rest.',
    ];
    final reflection = reflections[dayIndex % reflections.length];
    
    entries.add({
      'Date': dateStr,
      'Go to Bed': bedtime,
      'Sleep Latency': latency,
      'Wake Up': waketime,
      'Awakenings': awakenings,
      'Quality': quality,
      'Stimulants': stimulants,
      'Reflections': reflection,
    });
  }
  
  // Save to SharedPreferences
  final encodedList = jsonEncode(entries);
  await prefs.setString('sleepDiaryEntries', encodedList);
  
  print('✅ Seeded 20 sleep diary entries');
}
