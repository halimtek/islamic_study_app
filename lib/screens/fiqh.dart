import 'package:flutter/material.dart';

class FiqhPage extends StatelessWidget {
  const FiqhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF060E0C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Islamic Law (Fiqh)", style: TextStyle(color: Colors.white, fontSize: 16)),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15, top: 12, bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1B2522),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.bolt, color: Colors.amber, size: 16),
                Text(" 1250", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
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
            const SizedBox(height: 10),
            const Text("Master the", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("jurisprudence", style: TextStyle(color: Color(0xFF2DC194), fontSize: 32, fontWeight: FontWeight.bold)),
            const Text("of Islam.", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            
            _buildSearchBar(),
            const SizedBox(height: 25),
            _buildDailyChallenge(),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Categories", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                Text("View All", style: TextStyle(color: Colors.teal.shade300, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 20),

            _buildCategoryGrid(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF111917),
        prefixIcon: const Icon(Icons.search, color: Colors.white24),
        hintText: "Search topics (e.g. Wudu, Salah)...",
        hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildDailyChallenge() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111917),
        borderRadius: BorderRadius.circular(25),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1584281722570-349f257134c0'), // Quran image
          fit: BoxFit.cover,
          opacity: 0.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _badge("DAILY CHALLENGE", const Color(0xFF2DC194).withOpacity(0.2), const Color(0xFF2DC194)),
              const SizedBox(width: 8),
              _badge("Daily Challenge", Colors.white10, Colors.white60),
              const SizedBox(width: 8),
              _badge("2h left", Colors.white10, Colors.white60),
            ],
          ),
          const SizedBox(height: 20),
          const Text("The Fiqh of Purification", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text("Test your knowledge on Wudu, Ghusl, and Tayammum with 5 quick questions.", 
            style: TextStyle(color: Colors.white60, fontSize: 13)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("AK  MS  +12", style: TextStyle(color: Colors.white38, fontWeight: FontWeight.bold)),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.black, size: 18),
                label: const Text("Start", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2DC194), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _badge(String text, Color bg, Color txt) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(6)),
    child: Text(text, style: TextStyle(color: txt, fontSize: 10, fontWeight: FontWeight.bold)),
  );

  Widget _buildCategoryGrid() {
    final List<Map<String, dynamic>> cats = [
      {'t': 'Salah (Prayer)', 'd': 'Beginner', 'q': '15 Qs', 'i': Icons.mosque, 'c': Colors.teal, 'p': 0.6},
      {'t': 'Zakat & Charity', 'd': 'Intermediate', 'q': '8 Qs', 'i': Icons.volunteer_activism, 'c': Colors.orange, 'p': 0.0},
      {'t': 'Marriage', 'd': 'Advanced', 'q': '12 Qs', 'i': Icons.people, 'c': Colors.pink, 'p': 0.3},
      {'t': 'Islamic Finance', 'd': 'Expert', 'q': '20 Qs', 'i': Icons.balance, 'c': Colors.blue, 'p': 0.0},
      {'t': 'Sawm (Fasting)', 'd': 'Beginner', 'q': '10 Qs', 'i': Icons.nights_stay, 'c': Colors.deepPurple, 'p': 0.9},
      {'t': 'Inheritance', 'd': 'Level 5 Req.', 'q': 'Locked', 'i': Icons.calculate, 'c': Colors.grey, 'p': 0.0},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15, childAspectRatio: 0.9),
      itemBuilder: (context, index) {
        final item = cats[index];
        bool isLocked = item['q'] == 'Locked';
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFF111917), borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(item['i'], color: item['c'], size: 28),
                  Text(item['q'], style: const TextStyle(color: Colors.white38, fontSize: 11)),
                ],
              ),
              const Spacer(),
              Text(item['t'], style: TextStyle(color: isLocked ? Colors.white24 : Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(height: 4),
              Row(
                children: [
                  CircleAvatar(radius: 3, backgroundColor: isLocked ? Colors.grey : item['c']),
                  const SizedBox(width: 5),
                  Text(item['d'], style: const TextStyle(color: Colors.white38, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: item['p'],
                backgroundColor: Colors.white10,
                color: isLocked ? Colors.transparent : const Color(0xFF2DC194),
                minHeight: 4,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
        );
      },
    );
  }
}