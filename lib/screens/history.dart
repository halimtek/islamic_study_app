import 'package:flutter/material.dart';

class IslamicHistoryPage extends StatelessWidget {
  const IslamicHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C), // Deep dark green/black
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Islamic History", style: TextStyle(color: Colors.white, fontSize: 16)),
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
            // 1. Search Bar at the Top
            _buildSearchBar(),
            const SizedBox(height: 25),

            // 2. Daily Challenge Card (The Life of the Prophet)
            _buildHistoryHeaderCard(),
            const SizedBox(height: 30),

            // 3. Browse Topics Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Browse Topics", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.teal.shade300, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),

            // 4. Image-Based Grid
            _buildHistoryGrid(),
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

  Widget _buildSearchBar() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF111917),
        prefixIcon: const Icon(Icons.search, color: Colors.white24),
        hintText: "Search eras, figures, or events...",
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildHistoryHeaderCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1542618933-91bd9d41349f'), // Dark Mosque silhouette
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF1DE9B6).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
            child: const Text("Daily Challenge", style: TextStyle(color: Color(0xFF1DE9B6), fontSize: 10, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 50), // Spacing for silhouette effect
          const Text("The Life of the Prophet", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const Text("Mecca to Medina • 15 Questions", style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.black38, borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: const [
                    Icon(Icons.bolt, color: Colors.amber, size: 16),
                    Text(" 2x XP Boost", style: TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DE9B6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                child: const Text("Start Quiz", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHistoryGrid() {
    final List<Map<String, dynamic>> topics = [
      {'title': 'The Caliphates', 'tag': 'ERA', 'level': 'Level 1', 'img': 'https://images.unsplash.com/photo-1542618933-91bd9d41349f'},
      {'title': 'Golden Age', 'tag': 'SCIENCE', 'level': 'Level 3', 'img': 'https://images.unsplash.com/photo-1512916194211-3f2b7f5f7de3'},
      {'title': 'Key Battles', 'tag': 'CONFLICT', 'level': 'Level 4', 'img': 'https://images.unsplash.com/photo-1505461296292-7d67beed10a2'},
      {'title': 'Prophets', 'tag': 'STORIES', 'level': 'Level 2', 'img': 'https://images.unsplash.com/photo-1564121211835-e88c852648ab'},
      {'title': 'Art & Calligraphy', 'tag': 'CULTURE', 'level': 'Level 1', 'img': 'https://images.unsplash.com/photo-1564750531580-f00114068345'},
      {'title': 'Pre-Islamic Arabia', 'tag': 'CIVILIZATION', 'level': 'Locked', 'img': 'https://images.unsplash.com/photo-1534067783941-51c9c23ecefd'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: topics.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        final topic = topics[index];
        bool isLocked = topic['level'] == 'Locked';

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(topic['img']),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
            ),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(topic['tag'], style: const TextStyle(color: Color(0xFF1DE9B6), fontSize: 10, fontWeight: FontWeight.bold)),
              Text(topic['title'], style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Icon(isLocked ? Icons.lock : Icons.school, color: Colors.white54, size: 12),
                  const SizedBox(width: 4),
                  Text(topic['level'], style: const TextStyle(color: Colors.white54, fontSize: 11)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}