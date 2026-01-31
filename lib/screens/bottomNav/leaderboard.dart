import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1A16), // Matching Home background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text("Leaderboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune, color: Colors.white)),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // --- Weekly/All Time Toggle ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: _toggleBtn("Weekly", true)),
                      Expanded(child: _toggleBtn("All Time", false)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Podium Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _podiumUser("Ahmed", "2150 XP", "2", 35, Colors.grey),
                    _podiumUser("Fatima", "2400 XP", "1", 50, const Color(0xFFFFD700), isWinner: true),
                    _podiumUser("Zainab", "1900 XP", "3", 35, Colors.orangeAccent),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // --- Ranking List ---
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: ListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 100),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return _rankItem(index + 4, "User_${index + 10}", "Scholar", "1,520");
                    },
                  ),
                ),
              ),
            ],
          ),

          // --- "Sticky" Your Rank Bar ---
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF0D4D3B), Color(0xFF26A69A)]),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
              ),
              child: const Row(
                children: [
                  Text("12", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(width: 15),
                  CircleAvatar(radius: 20, backgroundColor: Colors.white24, child: Icon(Icons.person, color: Colors.white)),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("You", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text("Top 5%", style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("1,200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text("▲ 2 RANKS", style: TextStyle(color: Colors.white70, fontSize: 8)),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool active) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(text, style: TextStyle(color: active ? Colors.black : Colors.white54, fontWeight: FontWeight.bold)),
    );
  }

  Widget _podiumUser(String name, String xp, String rank, double radius, Color color, {bool isWinner = false}) {
    return Column(
      children: [
        if (isWinner) const Icon(Icons.workspace_premium, color: Colors.amber, size: 24),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
                boxShadow: isWinner ? [BoxShadow(color: color.withOpacity(0.5), blurRadius: 15, spreadRadius: 2)] : null,
              ),
              child: CircleAvatar(radius: radius, backgroundColor: Colors.white10, child: const Icon(Icons.person, color: Colors.white, size: 30)),
            ),
            Positioned(
              bottom: -2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
                child: Text(rank, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(xp, style: const TextStyle(color: Color(0xFF26A69A), fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _rankItem(int rank, String name, String title, String pts) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text(rank.toString(), style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold))),
          const CircleAvatar(radius: 22, backgroundColor: Colors.black12, child: Icon(Icons.person, color: Colors.grey)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
                Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(pts, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D4D3B))),
              const Text("PTS", style: TextStyle(fontSize: 8, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}