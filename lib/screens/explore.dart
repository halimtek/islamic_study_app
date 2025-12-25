import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The screen background is pure white
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Explore",
          style: TextStyle(color: Color(0xFF1A1A1A), fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Color(0xFF1A1A1A)),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFFFD4B5), // Peach skin tone from image
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            
            // 1. Search Bar - Background is NOT white (Soft Grey-Blue)
            _buildSearchBar(),
            const SizedBox(height: 20),

            // 2. Category Chips - Background is NOT white
            _buildCategoryChips(),
            const SizedBox(height: 25),

            // 3. Daily Challenge Banner (Dark Forest Green)
            _buildDailyChallengeBanner(),
            const SizedBox(height: 30),

            // 4. Trending Quizzes
            _buildSectionHeader("Trending Quizzes"),
            const SizedBox(height: 15),
            _buildTrendingCard(),
            
            const SizedBox(height: 30),

            // 5. New Arrivals Grid
            _buildSectionHeader("New Arrivals"),
            const SizedBox(height: 15),
            _buildNewArrivals(),
            
            const SizedBox(height: 30),

            // 6. Recommended for You
            _buildSectionHeader("Recommended for You"),
            const SizedBox(height: 15),
            _buildRecommendedItem("Architecture Quiz", "Famous mosques around th...", 0.4),
            _buildRecommendedItem("Tajweed Rules", "Master your recitation", 0.0),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFC), // Exact soft grey-blue tint
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEDF2F7)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search topics, surahs, or history...",
          hintStyle: TextStyle(color: Color(0xFFA0AEC0), fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF2DC194)),
          suffixIcon: Icon(Icons.tune, color: Color(0xFF2DC194)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ["All", "History", "Fiqh", "Quran"];
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              // Background is NOT white: Teal for selected, Light Grey for others
              color: isSelected ? const Color(0xFF2DC194) : const Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              categories[index],
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF718096),
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDailyChallengeBanner() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0D5D46), // Deep forest emerald
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.bolt, color: Colors.amber, size: 14),
                Text(" DAILY CHALLENGE", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Text("Test your knowledge\non Surah Al-Kahf", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("10 Questions • 5 mins", style: TextStyle(color: Colors.white60, fontSize: 12)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2DC194),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Play Now", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
        const Text("View All", style: TextStyle(color: Color(0xFF2DC194), fontWeight: FontWeight.bold, fontSize: 13)),
      ],
    );
  }

  Widget _buildTrendingCard() {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF2F7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exact Quiz Image Placeholder matching your screenshot
          Container(
            height: 140,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFE2E8F0), // Specific blue-grey placeholder
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: const Center(
              child: Text("Quiz Image", style: TextStyle(color: Color(0xFFA0AEC0), fontWeight: FontWeight.bold)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("HISTORY", style: TextStyle(color: Color(0xFF2DC194), fontSize: 10, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Prophets of Islam", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Journey through the lives...", style: TextStyle(color: Color(0xFF718096), fontSize: 12)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNewArrivals() {
    return Row(
      children: [
        Expanded(child: _buildSmallArrivalCard("Islamic Golden Age", "Science & Math")),
        const SizedBox(width: 12),
        Expanded(child: _buildSmallArrivalCard("Pillars of Faith", "Core beliefs")),
      ],
    );
  }

  Widget _buildSmallArrivalCard(String title, String sub) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FAFC), // Background is not white
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.auto_awesome, color: Color(0xFF2DC194), size: 24),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(sub, style: const TextStyle(color: Color(0xFF718096), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildRecommendedItem(String title, String sub, double progress) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF2F7)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFE6FFFA), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.mosque, color: Color(0xFF2DC194)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(sub, style: const TextStyle(color: Color(0xFF718096), fontSize: 12)),
                if (progress > 0) ...[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: const Color(0xFFEDF2F7),
                    color: const Color(0xFF2DC194),
                    minHeight: 4,
                  )
                ]
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFA0AEC0)),
        ],
      ),
    );
  }
}