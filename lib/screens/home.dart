import 'package:flutter/material.dart';
import 'history.dart';
import 'prophets_page.dart';
import 'daily_duas.dart';
import 'hadith.dart';
import 'fiqh.dart';
import 'pillars.dart';
import 'quran.dart';
import 'seerah.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Data for the 8 categories matching your image
  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Prophets',
      'sub': 'Stories of guidance',
      'icon': Icons.mosque,
      'color': Color(0xFF26A69A),
    },
    {
      'name': 'Quran',
      'sub': 'Divine revelation',
      'icon': Icons.menu_book,
      'color': Color(0xFF42A5F5),
    },
    {
      'name': 'History',
      'sub': 'Islamic heritage',
      'icon': Icons.history_edu,
      'color': Color(0xFFEC407A),
    },
    {
      'name': 'Hadith',
      'sub': 'Prophetic sayings',
      'icon': Icons.format_quote,
      'color': Color(0xFFFFB300),
    },
    {
      'name': 'Pillars',
      'childIcon': Icons.account_balance,
      'sub': 'Foundation of faith',
      'icon': Icons.home_filled,
      'color': Colors.white70,
    },
    {
      'name': 'Seerah',
      'sub': 'Life of the Prophet',
      'icon': Icons.person_pin_circle,
      'color': Color(0xFF66BB6A),
    },
    {
      'name': 'Duas',
      'sub': 'Daily prayers',
      'icon': Icons.volunteer_activism,
      'color': Color(0xFF26C6DA),
    },
    {
      'name': 'Law',
      'sub': 'Fiqh & Sharia',
      'icon': Icons.gavel,
      'color': Color(0xFFEF5350),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // --- Header Section ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ASSALAMU ALAIKUM",
                        style: TextStyle(
                          color: Color(0xFF26A69A),
                          fontSize: 11,
                          letterSpacing: 1.5,
                        ),
                      ),
                      Text(
                        "Islamic Quiz",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.local_fire_department,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Text(
                              " 12",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      // FIXED: Used Icon instead of NetworkImage to prevent SocketException
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: const Icon(Icons.person, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),
              // --- Ayah Card Section ---
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0D4D3B), Color(0xFF082D24)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Ayah of the Day",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF26A69A),
                            ),
                          ),
                        ),
                        // ADDED: Bookmark and Share Icons
                        const Row(
                          children: [
                            Icon(
                              Icons.bookmark_outline,
                              size: 20,
                              color: Colors.white54,
                            ),
                            SizedBox(width: 15),
                            Icon(
                              Icons.share_outlined,
                              size: 20,
                              color: Colors.white54,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Arabic',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "\"In the name of Allah, the Most Gracious, the Most Merciful.\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Divider(color: Colors.white10, thickness: 1),
                    ),
                    const Text(
                      "AL-FATIHA 1:1",
                      style: TextStyle(
                        color: Color(0xFF26A69A),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              // --- Categories Title ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Color(0xFF26A69A)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              // --- 8 Categories Grid ---
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  // HIGHER number = SHORTER card
                  // 1.35 is usually the sweet spot for the look in your screenshot
                  childAspectRatio: 1.35,
                ),
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return CategoryCard(
                    cat: cat,
                  ); // We call a separate stateful widget here
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),  
        );
  } 
  
}

class CategoryCard extends StatefulWidget {
  final Map<String, dynamic> cat;
  const CategoryCard({super.key, required this.cat});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isHovered = false;
@override
Widget build(BuildContext context) {
  return MouseRegion(
    onEnter: (_) => setState(() => _isHovered = true),
    onExit: (_) => setState(() => _isHovered = false),
    child: GestureDetector(
      onTap: () {
        if (widget.cat['name'] == 'Prophets') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProphetsPage()),
          );
        }
        if (widget.cat['name'] == 'Duas') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DailyDuasPage()),
          );
        }
        if (widget.cat['name'] == 'Quran') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuranicKnowledgePage()),
          );
         
        }
       
        if (widget.cat['name'] == 'Hadith') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HadithCollectionsPage()),
          );
        }
        if (widget.cat['name'] == 'History') {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const IslamicHistoryPage()),
          );
        }
        if (widget.cat['name'] == 'Pillars') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PillarsOfIslamPage()),
          );
          
        }
        if (widget.cat['name'] == 'Seerah') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SeerahPage()),
          );
          
        }
        if (widget.cat['name'] == 'Law') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FiqhPage()),
          );
         
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(10), // Slightly reduced padding
        decoration: BoxDecoration(
          color: _isHovered ? const Color(0xFF1A2E2A) : const Color(0xFF132521),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _isHovered ? const Color(0xFF26A69A).withOpacity(0.5) : Colors.white10,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Added this to prevent stretching
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8), // Smaller icon padding
                  decoration: BoxDecoration(
                    color: (widget.cat['color'] as Color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(widget.cat['icon'], color: widget.cat['color'], size: 20),
                ),
                Icon(Icons.arrow_forward, 
                  size: 14, 
                  color: _isHovered ? const Color(0xFF26A69A) : Colors.white24),
              ],
            ),
            const Spacer(), // Keeps the text at the bottom
            Text(
              widget.cat['name'], 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
              maxLines: 1, // Prevents text from wrapping to a second line
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.cat['sub'], 
              style: const TextStyle(fontSize: 10, color: Colors.white38),
              maxLines: 1, // Prevents subtitle from causing overflow
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ),
  );
}  }

