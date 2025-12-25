import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
void main() => runApp(IslamicQuizApp());

class IslamicQuizApp extends StatelessWidget {
  const IslamicQuizApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A1A16), // Dark background from image
      ),
      home: const MainScreen(),
    );
  }
}