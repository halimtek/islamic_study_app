import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  final Color accentTeal = const Color(0xFF26A69A);
  final Color darkBg = const Color(0xFF132521);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1A16),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white70),
        title: const Text("Leaderboard", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.tune, color: Colors.white70)),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              // --- Weekly/All Time Toggle ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: _toggleBtn("Weekly", true)),
                      Expanded(child: _toggleBtn("All Time", false)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // --- Podium Section ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _podiumUser("Ahmed", "2150 XP", "2", 35, Colors.grey.shade400),
                    _podiumUser("Fatima", "2400 XP", "1", 52, const Color(0xFFFFD700), isWinner: true),
                    _podiumUser("Zainab", "1900 XP", "3", 35, Colors.orangeAccent),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // --- Ranking List Container ---
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: darkBg.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    border: Border.all(color: Colors.white10, width: 0.5),
                  ),
                  child: Stack(
                    children: [
                      // The actual scrollable list
                      ListView.builder(
                        // 160px bottom padding ensures the last item clears the sticky bar
                        padding: const EdgeInsets.fromLTRB(25, 30, 25, 160), 
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return _rankItem(index + 4, "User_${index + 10}", "Active Scholar", "1,520");
                        },
                      ),
                      
                      // Soft Gradient Fade so items "disappear" elegantly behind the bar
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 100,
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF0A1A16).withOpacity(0),
                                  const Color(0xFF0A1A16).withOpacity(0.8),
                                  const Color(0xFF0A1A16),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // --- "Sticky" Your Rank Bar ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0D4D3B), Color(0xFF082D24)],
                    ),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 15,
                        offset: const Offset(0, 4),
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      const Text("12", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(width: 15),
                      CircleAvatar(
                        radius: 20, 
                        backgroundColor: Colors.white.withOpacity(0.1), 
                        child: const Icon(Icons.person, color: Colors.white)
                      ),
                      const SizedBox(width: 15),
                      const Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("You", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            Text("Top 5%", style: TextStyle(color: Colors.amber, fontSize: 10, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text("1,200", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text("▲ 2 RANKS", style: TextStyle(color: accentTeal, fontSize: 8, fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _toggleBtn(String text, bool active) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: active ? accentTeal : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text, 
        style: TextStyle(
          color: active ? Colors.black : Colors.white54, 
          fontWeight: FontWeight.bold,
          fontSize: 13,
        )
      ),
    );
  }

  Widget _podiumUser(String name, String xp, String rank, double radius, Color color, {bool isWinner = false}) {
    return Column(
      children: [
        if (isWinner) const Icon(Icons.workspace_premium, color: Colors.amber, size: 28),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color.withOpacity(0.5), width: 2),
              ),
              child: CircleAvatar(
                radius: radius, 
                backgroundColor: Colors.white.withOpacity(0.05), 
                child: Icon(Icons.person, color: Colors.white.withOpacity(0.8), size: radius * 0.8)
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
                child: Text(rank, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.black)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(xp, style: TextStyle(color: accentTeal, fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _rankItem(int rank, String name, String title, String pts) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text(rank.toString(), style: const TextStyle(color: Colors.white38, fontWeight: FontWeight.bold))),
          CircleAvatar(radius: 20, backgroundColor: Colors.white.withOpacity(0.05), child: const Icon(Icons.person, color: Colors.white24, size: 20)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text(title, style: const TextStyle(color: Colors.white38, fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(pts, style: TextStyle(fontWeight: FontWeight.bold, color: accentTeal)),
              const Text("PTS", style: TextStyle(fontSize: 8, color: Colors.white24, fontWeight: FontWeight.bold)),
            ],
          )
        ],
      ),
    );
  }
}