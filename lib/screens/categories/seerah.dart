import 'package:flutter/material.dart';
import 'package:islamic_study_app/data/quiz_data.dart';
import 'package:islamic_study_app/screens/question_screen.dart';

class SeerahPage extends StatelessWidget {
  const SeerahPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Seerah", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(Icons.settings, color: Colors.white, size: 20),
          )
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Featured Category Header
                _buildFeaturedHeader(),
                const SizedBox(height: 20),

                // 2. Stats Row
                Row(
                  children: [
                    Expanded(child: _buildStatCard(Icons.check_circle, "12/50", "ANSWERED", const Color(0xFF2DC194))),
                    const SizedBox(width: 15),
                    Expanded(child: _buildStatCard(Icons.emoji_events, "Top 5%", "GLOBAL RANK", Colors.amber)),
                  ],
                ),
                const SizedBox(height: 30),

                // 3. Quiz Chapters Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Quiz Chapters", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("View All", style: TextStyle(color: Colors.teal.shade300, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 20),

                // 4. Vertical Chapter List
                _buildChapterCard(
                  "The Year of the Elephant", 
                  "Understand the events surrounding the birth of the Prophet.", 
                  "BEGINNER", "10 Qs", "https://images.unsplash.com/photo-1509023467866-18548a1cb35d", 
                  status: "Start Quiz",
                ),
                _buildChapterCard(
                  "Life in Makkah", 
                  "The early revelations and the struggles of the first Muslims.", 
                  "INTERMEDIATE", "15 Qs", "https://images.unsplash.com/photo-1564121211835-e88c852648ab", 
                  status: "Continue",
                ),
                _buildChapterCard(
                  "The Hijrah", 
                  "The great migration from Makkah to Madinah.", 
                  "INTERMEDIATE", "12 Qs", "https://images.unsplash.com/photo-1534067783941-51c9c23ecefd", 
                  status: "Locked",
                ),
                _buildChapterCard(
                  "The Madinan Period", 
                  "Establishment of the state and major battles.", 
                  "ADVANCED", "20 Qs", "https://images.unsplash.com/photo-1590075865003-e48277993491", 
                  status: "Locked",
                ),
                
                const SizedBox(height: 100), // Padding for FAB
              ],
            ),
          ),
          
          // 5. Bottom "Quick Play" Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _buildQuickPlayButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1591604129939-f1efa4d9f7fa'), // Green dome image
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.amber.withOpacity(0.8), borderRadius: BorderRadius.circular(6)),
            child: const Text("FEATURED CATEGORY", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Text("Life of the Prophet\n(PBUH)", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold, height: 1.2)),
          const SizedBox(height: 10),
          const Text("Master the history of the final messenger through interactive quizzes.", 
            style: TextStyle(color: Colors.white70, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String val, String label, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF111917), borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(val, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
        ],
      ),
    );
  }

  Widget _buildChapterCard(String title, String desc, String tag, String qs, String img, {required String status}) {
    bool isLocked = status == "Locked";
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: const Color(0xFF111917), borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Header
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
              image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFF2DC194).withOpacity(0.15), borderRadius: BorderRadius.circular(6)),
                      child: Text(tag, style: const TextStyle(color: Color(0xFF2DC194), fontSize: 9, fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.description, color: Colors.white24, size: 14),
                        const SizedBox(width: 4),
                        Text(qs, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                const SizedBox(height: 15),
                // Action Button
                Align(
                  alignment: Alignment.centerRight,
                  child: isLocked 
                    ? Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.lock, color: Colors.white24, size: 16),
                            SizedBox(width: 8),
                            Text("Locked", style: TextStyle(color: Colors.white24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: status == "Continue" ? Colors.white.withOpacity(0.1) : const Color(0xFF2DC194),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(status, style: TextStyle(color: status == "Continue" ? Colors.white : Colors.black, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Icon(status == "Continue" ? Icons.play_arrow : Icons.arrow_forward, color: status == "Continue" ? Colors.white : Colors.black, size: 18),
                          ],
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickPlayButton(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigation logic goes here
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) =>  QuestionScreen(
             categoryName: "Seerah",
             questions: QuizData.akhlaqQuestions
            ),
            ),
        );
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 190,
        height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF2DC194),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: const Color(0xFF2DC194).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.shuffle, color: Colors.black, size: 20),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Quick Play", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
              Text("RANDOM TOPIC", style: TextStyle(color: Colors.black54, fontSize: 9, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    ),
    );
  }
}