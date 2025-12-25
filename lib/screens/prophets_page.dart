import 'package:flutter/material.dart';

class ProphetsPage extends StatelessWidget {
  const ProphetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Prophets", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              backgroundColor: Colors.white.withOpacity(0.05),
              label: const Row(
                children: [
                  Icon(Icons.stars, color: Colors.amber, size: 16),
                  Text(" 1,450", style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Search Bar ---
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF132521),
                hintText: "Search Prophet or Topic...",
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.white38),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),

            // --- Filter Chips ---
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip("All", true),
                  _filterChip("Beginner", false),
                  _filterChip("Intermediate", false),
                  _filterChip("Advanced", false),
                ],
              ),
            ),

            // --- Daily Challenge Card ---
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1542810634-71277d95dcbb?q=80&w=1000&auto=format&fit=crop'), // Placeholder for Mosque silhouette
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: Colors.amber.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.emoji_events_outlined, color: Colors.amber, size: 14),
                        Text(" Daily Challenge", style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text("Prophet Muhammad\n(PBUH)", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
                  const Text("The Final Messenger • 15 Questions", style: TextStyle(color: Colors.white70, fontSize: 12)),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF26A69A),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Start Quiz", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            // --- Quizzes List Section ---
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("All Quizzes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                TextButton(onPressed: () {}, child: const Text("View Progress", style: TextStyle(color: Color(0xFF26A69A)))),
              ],
            ),
            
            _quizListItem("Prophet Adam (AS)", "The First Man • Beginner", 0.75, true),
            _quizListItem("Prophet Nuh (AS)", "The Ark & The Flood • Medium", 0.0, false, reward: "50 XP"),
            _quizListItem("Prophet Ibrahim (AS)", "Father of Prophets • Hard", 0.0, false, reward: "100 XP"),
            _quizListItem("Prophet Yusuf (AS)", "The Dream Interpreter • Medium", 0.0, false, reward: "75 XP"),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF26A69A) : const Color(0xFF132521),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: isSelected ? Colors.transparent : Colors.white10),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.black : Colors.white54, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _quizListItem(String title, String sub, double progress, bool isUnlocked, {String? reward}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF132521), borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Container(
            height: 50, width: 50,
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.05), borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.image, color: Colors.white24), // Swap with your actual images (Leaf, Ark, etc.)
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 11)),
                if (isUnlocked) ...[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: progress, backgroundColor: Colors.white10, color: const Color(0xFF26A69A), minHeight: 4),
                ] else if (reward != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.bolt, color: Colors.tealAccent, size: 14),
                      Text(" $reward Reward", style: const TextStyle(color: Colors.tealAccent, fontSize: 10)),
                    ],
                  ),
                ]
              ],
            ),
          ),
          if (isUnlocked)
            const Icon(Icons.play_circle_fill, color: Color(0xFF26A69A), size: 30)
          else
            const Icon(Icons.lock_outline, color: Colors.white24, size: 24),
        ],
      ),
    );
  }
}