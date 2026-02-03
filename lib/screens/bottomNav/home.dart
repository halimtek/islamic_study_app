import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
// Import your category pages
import '../categories/history.dart';
import '../categories/prophets_page.dart';
import '../categories/daily_duas.dart';
import '../categories/hadith.dart';
import '../categories/fiqh.dart';
import '../categories/pillars.dart';
import '../categories/quran.dart';
import '../categories/seerah.dart';
import '../allcategories.dart';

class QuranService {
  static const String _baseUrl = "https://api.quran.com/api/v4";

  Future<Map<String, dynamic>> fetchAyahOfTheDay() async {
    try {
      final response = await http
          .get(
            Uri.parse(
              '$_baseUrl/verses/random?language=en&translations=131&fields=text_uthmani',
            ),
          )
          .timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['verse'];
        return {
          'arabic': data['text_uthmani'],
          'translation': data['translations'][0]['text'],
          'reference': "Surah ${data['verse_key']}",
          'url': "https://quran.com/${data['verse_key'].replaceAll(':', '/')}",
        };
      }
    } catch (e) {
      debugPrint("API Error: $e");
    }
    return {};
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final QuranService _quranService = QuranService();

  // Safety Fix: Initialize here directly to avoid the "Late Initialization" error
  late Future<Map<String, dynamic>> _ayahFuture = _quranService
      .fetchAyahOfTheDay();

  @override
  void initState() {
    super.initState();
    // We keep this here as well for good measure
    _ayahFuture = _quranService.fetchAyahOfTheDay();
  }

  // --- YOUR DATA ---
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
              // --- YOUR ORIGINAL HEADER ---
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
                        "Welcome Back",
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
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        child: const Icon(Icons.person, color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // --- LIVE AYAH CARD (Restored Icons and UI) ---
              FutureBuilder<Map<String, dynamic>>(
                future: _ayahFuture,
                builder: (context, snapshot) {
                  String arabic = "بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ";
                  String translation =
                      "In the name of Allah, the Most Gracious, the Most Merciful.";
                  String reference = "AL-FATIHA 1:1";
                  String? url;

                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    arabic = snapshot.data!['arabic'];
                    translation = snapshot.data!['translation'].replaceAll(
                      RegExp(r'<[^>]*>'),
                      '',
                    );
                    reference = snapshot.data!['reference'];
                    url = snapshot.data!['url'];
                  }

                  return GestureDetector(
                    onTap: () async {
                      if (url != null) {
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(
                            uri,
                            mode: LaunchMode.externalApplication,
                          );
                        }
                      }
                    },
                    child: Container(
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
                                child: Text(
                                  snapshot.connectionState ==
                                          ConnectionState.waiting
                                      ? "Loading..."
                                      : "Ayah of the Day",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Color(0xFF26A69A),
                                  ),
                                ),
                              ),
                              // RESTORED: Bookmark and Share Icons
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
                          Text(
                            arabic,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Arabic',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "\"$translation\"",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                              height: 1.4,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Divider(color: Colors.white10, thickness: 1),
                          ),
                          Text(
                            reference.toUpperCase(),
                            style: const TextStyle(
                              color: Color(0xFF26A69A),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 30),

              // --- CATEGORY TITLE ---
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
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllCategoriesScreen(),
                      ),
                    ),
                    child: const Text(
                      "View All",
                      style: TextStyle(color: Color(0xFF26A69A)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.35,
                ),
                itemBuilder: (context, index) =>
                    CategoryCard(category: categories[index]),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// --- YOUR ORIGINAL CATEGORY CARD ---
class CategoryCard extends StatefulWidget {
  final Map<String, dynamic> category;
  const CategoryCard({super.key, required this.category});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isHovered = false;
  bool _isNavigating = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: _isNavigating,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () async {
            setState(() {
              _isNavigating = true;
              _isHovered = false;
            });
            await Future.delayed(const Duration(milliseconds: 50));
            if (!context.mounted) return;

            Widget page;
            switch (widget.category['name']) {
              case 'Prophets':
                page = const ProphetsPage();
                break;
              case 'Duas':
                page = const DailyDuasPage();
                break;
              case 'Quran':
                page = const QuranicKnowledgePage();
                break;
              case 'Hadith':
                page = const HadithCollectionsPage();
                break;
              case 'History':
                page = const IslamicHistoryPage();
                break;
              case 'Pillars':
                page = const PillarsOfIslamPage();
                break;
              case 'Seerah':
                page = const SeerahPage();
                break;
              case 'Law':
                page = const FiqhPage();
                break;
              default:
                return;
            }
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => page),
            );
            if (mounted) setState(() => _isNavigating = false);
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
                ),
                Text(
                  widget.category['sub'],
                  style: const TextStyle(fontSize: 10, color: Colors.white38),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
