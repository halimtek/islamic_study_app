import 'package:flutter/material.dart';
import 'package:islamic_study_app/screens/question_screen.dart';
import 'package:islamic_study_app/data/quiz_data.dart';

class QuranicKnowledgePage extends StatelessWidget {
  const QuranicKnowledgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Quranic Knowledge", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        actions: [
          _buildLevelBadge(),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // Header Typography
            const Text("Expand your", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("Sacred Knowledge", style: TextStyle(color: Color(0xFF2DC194), fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text(
              "Select a topic to begin your journey.",
              style: TextStyle(color: Colors.white54, fontSize: 14),
            ),
            const SizedBox(height: 25),

            // Daily Challenge Card
            _buildDailyChallengeCard(context),
            const SizedBox(height: 25),

            // Horizontal Category Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildChip("All Topics", true),
                  _buildChip("Surahs", false),
                  _buildChip("Prophets", false),
                  _buildChip("Tajweed", false),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Vertical List of Topics
            _buildTopicItem("Surah Al-Baqarah", "50 Qs • Top 5%", Icons.menu_book, "HARD", Colors.redAccent),
            _buildTopicItem("Prophets in the...", "25 Qs • Stories & Lessons", Icons.group, "MEDIUM", Colors.amber),
            _buildTopicItem("Tajweed Rules", "15 Qs • Audio Enhanced", Icons.record_voice_over, "EASY", Colors.teal),
            _buildTopicItem("Vocabulary Builder", "30 Words • Daily Practice", Icons.translate, "MEDIUM", Colors.amber),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildLevelBadge() {
    return Container(
      margin: const EdgeInsets.only(right: 15, top: 12, bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1B2522),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Row(
        children: const [
          Icon(Icons.military_tech, color: Colors.amber, size: 16),
          SizedBox(width: 4),
          Text("Lvl 5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDailyChallengeCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111917),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF2DC194).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                child: const Text("DAILY CHALLENGE", style: TextStyle(color: Color(0xFF2DC194), fontSize: 10, fontWeight: FontWeight.bold)),
              ),
              const Icon(Icons.auto_awesome, color: Colors.amber, size: 40), // Pattern representation
            ],
          ),
          const SizedBox(height: 10),
          const Text("Surah Al-Kahf", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("The Cave • 110 Verses", style: TextStyle(color: Colors.white54, fontSize: 13)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("👤👤👤 +40", style: TextStyle(color: Colors.white38)),
              ElevatedButton(
                onPressed: () {
                  // Start Challenge Logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionScreen(
                        categoryName: "Quran",
                        questions: QuizData.quranQuestions, // Provide relevant questions here
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2DC194),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Start Quiz", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF2DC194) : const Color(0xFF1B2522),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        label,
        style: TextStyle(color: isSelected ? Colors.black : Colors.white60, fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _buildTopicItem(String title, String sub, IconData icon, String tag, Color tagCol) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111917),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), shape: BoxShape.circle),
            child: Icon(icon, color: Colors.amber.shade200, size: 22),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: tagCol.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
                      child: Text(tag, style: TextStyle(color: tagCol, fontSize: 9, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right, color: Colors.white24),
        ],
      ),
    );
  }
}