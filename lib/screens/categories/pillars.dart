import 'package:flutter/material.dart';
import 'package:islamic_study_app/data/quiz_data.dart';
import 'package:islamic_study_app/screens/question_screen.dart';

class PillarsOfIslamPage extends StatelessWidget {
  const PillarsOfIslamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Pillars of Islam", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        actions: [
          _buildTrophyBadge(),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Large Header Card
                _buildFoundationsHeader(),
                const SizedBox(height: 30),

                // 2. Section Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Select a Topic", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("5 Topics", style: TextStyle(color: Colors.white38, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 20),

                // 3. Horizontal List Items
                _buildTopicItem("Shahada", "The Declaration of Faith. Affirming there is no god but...", "الشهادة", Icons.fingerprint, 0.0),
                _buildTopicItem("Salah", "The five daily prayers. Spiritual connection and mindfulness.", "صلاة", Icons.mosque, 0.4),
                _buildTopicItem("Zakat", "Almsgiving and charity. Purifying wealth by helping the needy.", "زكاة", Icons.volunteer_activism, 0.0),
                _buildTopicItem("Sawm", "Fasting during Ramadan. Discipline, empathy, and spiritu...", "صوم", Icons.nights_stay, 0.0),
                _buildTopicItem("Hajj", "The Pilgrimage to Mecca. The journey of a lifetime for unity.", "حج", Icons.public, 0.0),
                
                const SizedBox(height: 100), // Space for the FAB
              ],
            ),
          ),
          
          // 4. Shuffle Quiz Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _buildShuffleButton(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrophyBadge() {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 12, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2522),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Icon(Icons.emoji_events, color: Color(0xFF2DC194), size: 16),
          Text(" 0/5", style: TextStyle(color: Color(0xFF2DC194), fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildFoundationsHeader() {
    return Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1590075865003-e48277993491'), // Mosque arches
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(radius: 3, backgroundColor: Color(0xFF2DC194)),
              SizedBox(width: 8),
              Text("CATEGORY", style: TextStyle(color: Color(0xFF2DC194), fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 4),
          const Text("Foundations of Faith", style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
          const Text("Master the 5 pillars to complete this level.", style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildTopicItem(String title, String desc, String arabic, IconData icon, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111917),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: const Color(0xFF064D3B).withOpacity(0.3), borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, color: const Color(0xFF2DC194), size: 24),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                        Text(arabic, style: const TextStyle(color: Color(0xFF2DC194), fontSize: 14)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc, style: const TextStyle(color: Colors.white38, fontSize: 12), maxLines: 2),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.play_circle_fill, color: Colors.white24, size: 30),
            ],
          ),
          if (progress > 0) ...[
            const SizedBox(height: 15),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white10,
              color: const Color(0xFF2DC194),
              minHeight: 3,
              borderRadius: BorderRadius.circular(10),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildShuffleButton(BuildContext context) {
  return InkWell(
    onTap: () {
      // Navigation logic goes here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionScreen(
            categoryName: "Pillars of Islam",
            questions: QuizData.pillarsQuestions,
          ),
        ),
      );
    },
    // Adding a borderRadius to InkWell ensures the ripple stays inside the button corners
    borderRadius: BorderRadius.circular(30),
    child: Container(
      width: 180,
      height: 55,
      decoration: BoxDecoration(
        color: const Color(0xFF2DC194),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2DC194).withOpacity(0.3), 
            blurRadius: 10, 
            offset: const Offset(0, 5)
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.shuffle, color: Colors.black, size: 20),
          SizedBox(width: 10),
          Text("Shuffle Quiz", 
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)
          ),
        ],
      ),
    ),
  );
}
}