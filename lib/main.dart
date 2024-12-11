import 'package:flutter/material.dart';
import 'package:islami/onboarding_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {OnboardingScreen.routeName:(context) => const OnboardingScreen()},
    );
  }
}
