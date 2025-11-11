import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_drive/pages/onboarding_page.dart';
import 'package:test_drive/pages/first_page.dart';
import 'package:test_drive/pages/login_page.dart';
import 'package:test_drive/utils/seed_data.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false, 
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkNavigation(); // Renamed function for clarity
  }

  Future<void> _checkNavigation() async {
    // Seed test data on first run (comment out after testing)
    await seedSleepDiaryData();
    
    // Add a small delay to allow the splash screen to be seen
    await Future.delayed(const Duration(milliseconds: 500));
    
    // As requested, always navigate to the LoginPage first.
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginPage(), 
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}