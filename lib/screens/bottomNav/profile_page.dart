import 'package:flutter/material.dart';
import '../settings_page.dart';
import '../../utils/profile_utils.dart';
import '../../providers/app_state_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final Color accentTeal = const Color(0xFF26A69A);
  final Color darkCard = const Color(0xFF132521);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1A16), // HalimTek Deep Dark
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 25),
            _buildStatsHorizontal(),
            const SizedBox(height: 35),
            _buildPerformanceSection(),
            const SizedBox(height: 35),
            _buildBadgesSection(),
            const SizedBox(height: 35),
            _buildAccountDetails(),
            const SizedBox(height: 35),
            _buildLogoutButton(),
            const SizedBox(height: 120), // Extra space for navigation
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final appState = Provider.of<AppStateProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60, bottom: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0D4D3B), Color(0xFF082D24)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsPage()),
                      );
                    },
                    icon: const Icon(Icons.settings, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: accentTeal.withOpacity(0.5), width: 2),
                ),
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white10,
                  backgroundImage: appState.imageFile != null
                      ? FileImage(appState.imageFile!) as ImageProvider
                      : const AssetImage('assets/profile_picture.jpg'),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: GestureDetector(
                  onTap: () => ProfileUtils.showEditSheet(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: accentTeal,
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF082D24), width: 3),
                    ),
                    child: const Icon(Icons.camera_alt, size: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            appState.userName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: const Text(
                  "SEEKER OF KNOWLEDGE",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "Lvl 12",
                style: TextStyle(color: accentTeal, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatsHorizontal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          _statCard(Icons.quiz_outlined, "QUIZZES", "42", accentTeal),
          _statCard(Icons.leaderboard_outlined, "RANK", "#154", Colors.orangeAccent),
          _statCard(Icons.emoji_events_outlined, "SCORE", "8.5k", accentTeal),
        ],
      ),
    );
  }

  Widget _statCard(IconData icon, String label, String value, Color color) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(vertical: 22),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Performance",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "History >",
                style: TextStyle(color: accentTeal, fontSize: 13, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Accuracy", style: TextStyle(color: Colors.white54, fontSize: 14)),
              Text("85%", style: TextStyle(color: accentTeal, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.85,
              backgroundColor: Colors.white.withOpacity(0.05),
              color: accentTeal,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Badges", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("8/24", style: TextStyle(color: Colors.white24, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _badgeIcon("RAMADAN\nEXPERT", Icons.mosque_outlined, Colors.orangeAccent, "Lvl 5", true),
              _badgeIcon("HADITH\nSCHOLAR", Icons.menu_book_outlined, accentTeal, "", true),
              _badgeIcon("DAILY\nWORSHIPPER", Icons.lock_outline, Colors.white10, "", false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _badgeIcon(String label, IconData icon, Color color, String level, bool isUnlocked) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                color: isUnlocked ? color.withOpacity(0.1) : Colors.white.withOpacity(0.02),
                shape: BoxShape.circle,
                border: Border.all(color: isUnlocked ? color.withOpacity(0.5) : Colors.white10, width: 2),
              ),
              child: Icon(icon, color: isUnlocked ? color : Colors.white12, size: 32),
            ),
            if (level.isNotEmpty)
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
                  child: Text(level, style: const TextStyle(color: Colors.black, fontSize: 9, fontWeight: FontWeight.bold)),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isUnlocked ? Colors.white : Colors.white12,
            fontSize: 9,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountDetails() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Account Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white)),
          const SizedBox(height: 25),
          _detailRow(Icons.email_outlined, "EMAIL", "abdihalim487@gmail.com"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Divider(color: Colors.white10),
          ),
          _detailRow(Icons.public_outlined, "COUNTRY", "Ethiopia"),
        ],
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: accentTeal.withOpacity(0.7), size: 22),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white)),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.white10, size: 18),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return TextButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.logout, color: Colors.redAccent, size: 20),
      label: const Text(
        "Log Out",
        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 15),
      ),
    );
  }
}