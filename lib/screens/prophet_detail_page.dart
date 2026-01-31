import 'package:flutter/material.dart';
import 'package:islamic_study_app/screens/question_screen.dart';
import '../data/quiz_data.dart';

class ProphetStoryPage extends StatelessWidget {
  final String name;
  final String subtitle;
  final String storyContent;
  final String imageUrl;

  const ProphetStoryPage({
    super.key,
    required this.name,
    required this.subtitle,
    required this.storyContent,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081411),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // 1. Hero Image Header (FIXED colorFilter error here)
              SliverAppBar(
                expandedHeight: 350,
                backgroundColor: const Color(0xFF081411),
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    // FIX: Using color and colorBlendMode instead of colorFilter
                    color: Colors.black.withOpacity(0.4),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),

              // 2. Story Content
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(25),
                  decoration: const BoxDecoration(
                    color: Color(0xFF081411),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFF26A69A),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        "HISTORY",
                        style: TextStyle(
                          color: Colors.amber,
                          letterSpacing: 1.5,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        storyContent,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          height: 1.8,
                        ),
                      ),
                      const SizedBox(height: 120), // Padding for the fixed button
                    ],
                  ),
                ),
              ),
            ],
          ),

          // 3. Custom Back Button
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // 4. Fixed Bottom Start Quiz Button
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      categoryName: name.toUpperCase(),
                      questions: QuizData.prophetQuestions,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26A69A),
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 10,
              ),
              child: const Text(
                "START THE QUIZ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}