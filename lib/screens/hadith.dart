import 'package:flutter/material.dart';

class HadithCollectionsPage extends StatelessWidget {
  const HadithCollectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C), // Very dark emerald/black background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1A2421),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withOpacity(0.5)),
            ),
            child: Row(
              children: const [
                Icon(Icons.emoji_events, color: Colors.amber, size: 16),
                SizedBox(width: 5),
                Text("Lvl 5", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Explore the", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const Text("Teachings", style: TextStyle(color: Color(0xFF26A69A), fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text(
              "Test your knowledge on the sayings and traditions of the Prophet (PBUH).",
              style: TextStyle(color: Colors.white38, fontSize: 14),
            ),
            const SizedBox(height: 25),
            
            // Search Bar
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF121B19),
                prefixIcon: const Icon(Icons.search, color: Colors.white24),
                hintText: "Search narrators, topics, or books...",
                hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 30),

            // Featured Card: Sunnah in Daily Life
            _buildFeaturedCard(),

            const SizedBox(height: 30),

            // Books & Themes Grid
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Books & Themes", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.teal.shade300, fontSize: 13)),
              ],
            ),
            const SizedBox(height: 20),

            // 2x2 Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.85,
              children: [
                _buildBookCard("Sahih Al-Bukhari", "Authentic Narrations", "HARD", "20 Qs", Icons.menu_book, Colors.blue),
                _buildBookCard("40 Hadith", "Imam An-Nawawi", "MEDIUM", "40 Qs", Icons.star, Colors.amber),
                _buildBookCard("Riyad as-Salihin", "Gardens of Righteous", "MEDIUM", "15 Qs", Icons.mosque, Colors.green),
                _buildBookCard("Sahih Muslim", "Noble Traditions", "HARD", "25 Qs", Icons.collections_bookmark, Colors.purple),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1590075865003-e48277993491?q=80&w=1000&auto=format&fit=crop'), // Example mosque arch background
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _badge("Daily Challenge", Colors.amber.withOpacity(0.2), Colors.amber),
              const SizedBox(width: 10),
              _badge("12h left", Colors.black45, Colors.white),
            ],
          ),
          const SizedBox(height: 15),
          const Text("Sunnah in Daily Life", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text("Master the daily practices and etiquette of the Prophet (PBUH) for huge rewards.", 
            style: TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.flash_on, color: Color(0xFF26A69A), size: 18),
                  SizedBox(width: 5),
                  Text("500 XP", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF26A69A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Row(
                  children: const [
                    Text("Start Quiz", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    Icon(Icons.play_arrow, color: Colors.black),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _badge(String text, Color bg, Color textCol) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(color: textCol, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildBookCard(String title, String desc, String difficulty, String count, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF121B19),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color, size: 20),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(color: Colors.white38, fontSize: 10)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(difficulty, style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
              Text(count, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}