import 'dart:async';
import 'package:flutter/material.dart';
import 'entry_page.dart'; // Ensure this points to your home page file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // 1. Set initial opacity to 0 (invisible)
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // 2. Trigger the fade-in shortly after the screen loads
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0; // Change to 1.0 to trigger the animation
        });
      }
    });

    // 3. Move to the next page after 3.5 seconds
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const EntryPage(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // This makes the transition between screens a fade too!
              return FadeTransition(opacity: animation, child: child);
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081411), // Your Islamic Study theme color
      body: Center(
        child: AnimatedOpacity(
          // 4. Use the opacity variable here
          opacity: _opacity,
          duration: const Duration(seconds: 2), // How long the fade-in takes
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.mosque,
                size: 120,
                color: Color(0xFF26A69A),
              ),
              const SizedBox(height: 25),
              const Text(
                "ISLAMIC STUDY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.5,
                ),
              ),
              const SizedBox(height: 40),
              // Optional: a subtle indicator
              const SizedBox(
                width: 30,
                child: LinearProgressIndicator(
                  color: Color(0xFF26A69A),
                  backgroundColor: Colors.white10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}