import 'package:flutter/material.dart';

class DailyDuasPage extends StatelessWidget {
  const DailyDuasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF081411), // Dark green base
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Daily Duas", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.stars, color: Colors.amber, size: 18),
                SizedBox(width: 5),
                Text("1250", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- 1. Daily Inspiration Card ---
            _buildInspirationCard(),

            const SizedBox(height: 25),

            // --- 2. Search Bar ---
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.05),
                prefixIcon: const Icon(Icons.search, color: Colors.white38),
                hintText: "Find specific Dua topics...",
                hintStyle: const TextStyle(color: Colors.white38),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),

            const SizedBox(height: 20),

            // --- 3. Filter Chips ---
            _buildFilters(),

            const SizedBox(height: 30),

            // --- 4. Categories Section ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Categories", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.teal.shade300, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),

            // --- 5. Dua Category List ---
            _duaItem("Morning & Evening", "Essential Adhkar for daily...", "5 Questions", "3 Mins", "EASY", Colors.orange, Icons.wb_sunny),
            _duaItem("Prayer (Salah)", "Duas said during and after...", "10 Questions", "8 Mins", "MEDIUM", Colors.blue, Icons.mosque),
            _duaItem("Travel & Journeys", "Supplications for safe...", "5 Questions", "4 Mins", "EASY", Colors.purple, Icons.flight),
            _duaItem("Hardship & Ease", "Duas for times of distress...", "15 Questions", "12 Mins", "HARD", Colors.red, Icons.favorite),
          ],
        ),
      ),
    );
  }

  Widget _buildInspirationCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF132521),
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(
          image: const AssetImage('assets/pattern.png'), // Optional pattern background
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.teal.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: const Text("DAILY INSPIRATION", style: TextStyle(color: Color(0xFF26A69A), fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Text("Revive Your Heart", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            "\"Verily, in the remembrance of Allah do hearts find rest.\"",
            style: TextStyle(color: Colors.white70, fontSize: 14, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 5),
          const Text("— Surah Ar-Ra'd (13:28)", style: TextStyle(color: Colors.white38, fontSize: 12)),
          const SizedBox(height: 15),
          Row(
            children: const [
              Text("Read Today's Dua", style: TextStyle(color: Color(0xFF26A69A), fontWeight: FontWeight.bold)),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward, color: Color(0xFF26A69A), size: 16),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _filterChip("All", true),
          _filterChip("Easy", false),
          _filterChip("Medium", false),
          _filterChip("Hard", false),
        ],
      ),
    );
  }

  Widget _filterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF26A69A) : const Color(0xFF132521),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.black : Colors.white60, fontWeight: FontWeight.bold)),
    );
  }

  Widget _duaItem(String title, String sub, String ques, String time, String level, Color iconCol, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF132521), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconCol.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(icon, color: iconCol, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(5)),
                      child: Text(level, style: TextStyle(color: iconCol, fontSize: 8, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.list_alt, color: Colors.white24, size: 14),
                    const SizedBox(width: 5),
                    Text(ques, style: const TextStyle(color: Colors.white24, fontSize: 11)),
                    const SizedBox(width: 15),
                    const Icon(Icons.access_time, color: Colors.white24, size: 14),
                    const SizedBox(width: 5),
                    Text(time, style: const TextStyle(color: Colors.white24, fontSize: 11)),
                  ],
                )
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white24, size: 16),
        ],
      ),
    );
  }
}