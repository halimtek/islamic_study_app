import 'package:flutter/material.dart';
// import 'package:islamic_study_app/screens/questionscreen.dart';
// import 'package:islamic_study_app/screens/quizresults.dart';
import '../categories/history.dart';
import '../categories/prophets_page.dart';
import '../categories/daily_duas.dart';
import '../categories/hadith.dart';
import '../categories/fiqh.dart';
import '../categories/pillars.dart';
import '../categories/quran.dart';
import '../categories/seerah.dart';
import '../allcategories.dart';

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
                          // to decorate the container
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(
                            20,
                          ), //to define the roundness of the container
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
                        backgroundColor: Colors.white.withValues(
                          alpha: 0.1,
                        ), // the same as withOpacity(0.1)
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
                        Row(
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
                    onPressed: () {
                      // Navigate to all categories page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllCategoriesScreen(),
                        ),
                      );
                    },
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
                  final category = categories[index];
                  return CategoryCard(
                    category: category,
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
  final Map<String, dynamic> category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isHovered = false;
  bool _isNavigating = false; // NEW: Prevents mouse tracking during navigation

  @override
  Widget build(BuildContext context) {
    // 1. Wrap in IgnorePointer to "hide" the widget from the mouse during navigation
    return IgnorePointer(
      ignoring: _isNavigating,
      child: MouseRegion(
        onEnter: (_) {
          // if (!_isNavigating) setState(() => _isHovered = true);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && !_isNavigating) {
              setState(() => _isHovered = true);
            }
          });
        },
        onExit: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted && !_isNavigating) {
              setState(() => _isHovered = false);
            }
          });
          // if (!_isNavigating) setState(() => _isHovered = false);
        },
        child: GestureDetector(
          onTap: () async {
            // 2. Lock navigation and reset hover look immediately
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                setState(() {
                  _isNavigating = true;
                  _isHovered = false;
                });
              }
            });
            // 3. Force the engine to process the "un-hover" before moving away
            await Future.delayed(Duration(milliseconds: 50));
            if (!context.mounted) return;

            // 4. Perform Navigation
            switch (widget.category['name']) {
              case 'Prophets':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProphetsPage()),
                );
                break;
              case 'Duas':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DailyDuasPage()),
                );
                break;
              case 'Quran':
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const QuranicKnowledgePage(),
                  ),
                );
                break;
              case 'Hadith':
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HadithCollectionsPage(),
                  ),
                );
                break;
              case 'History':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const IslamicHistoryPage()),
                );
                break;
              case 'Pillars':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PillarsOfIslamPage()),
                );
                break;
              case 'Seerah':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SeerahPage()),
                );
                break;
              case 'Law':
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FiqhPage()),
                );
                break;
            }

            // 5. Unlock when user comes back (important for 'back' button)
            if (mounted) {
              setState(() => _isNavigating = false);
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color(0xFF1A2E2A)
                  : const Color(0xFF132521),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(
                color: _isHovered
                    ? const Color(0xFF26A69A).withOpacity(0.5)
                    : Colors.white10,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (widget.category['color'] as Color).withOpacity(
                          0.15,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        widget.category['icon'],
                        color: widget.category['color'],
                        size: 20,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 14,
                      color: _isHovered
                          ? const Color(0xFF26A69A)
                          : Colors.white24,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  widget.category['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.category['sub'],
                  style: const TextStyle(fontSize: 10, color: Colors.white38),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
