import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'home.dart';
import 'explore.dart';
import 'leaderboard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // This list ensures your pages are swapped in the middle
  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(), // This is the "Quiz/Topics" icon
    const LeaderboardPage(),
    const ProfilePage(), // Placeholder for 4th tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // This allows the page content to go behind the bottom bar
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      
      // THE FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You could make this open a "Quick Quiz" or jump to Prophets
          setState(() => _currentIndex = 1); 
        },
        backgroundColor: const Color(0xFF26A69A),
        shape: const CircleBorder(),
        elevation: 4,
        child: const Icon(Icons.play_arrow, color: Colors.black, size: 35),
      ),

      // DOCKING THE BUTTON IN THE CENTER
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF081411),
        shape: const CircularNotchedRectangle(), // The "scoop" for the button
        notchMargin: 8.0,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left Group
              Row(
                children: [
                  _navItem(Icons.home_filled, "Home", 0),
                  const SizedBox(width: 25),
                  _navItem(Icons.explore, "Explore", 1),
                ],
              ),
              // Right Group
              Row(
                children: [
                  _navItem(Icons.leaderboard, "Rank", 2),
                  const SizedBox(width: 25),
                  _navItem(Icons.person, "Profile", 3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int index) {
    bool isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon, 
            color: isActive ? const Color(0xFF26A69A) : Colors.white38,
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label, 
            style: TextStyle(
              color: isActive ? const Color(0xFF26A69A) : Colors.white38,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}