import 'package:flutter/material.dart';
import 'package:islamic_study_app/screens/question_screen.dart';
import '../../data/quiz_data.dart';
import '../prophet_detail_page.dart';

// CHANGE 1: Convert to StatefulWidget
class ProphetsPage extends StatefulWidget {
  const ProphetsPage({super.key});

  @override
  State<ProphetsPage> createState() => _ProphetsPageState();
}

class _ProphetsPageState extends State<ProphetsPage> {
  // Add this variable to track the active tab
  String activeFilter = "All";
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = "";
  final FocusNode _searchFocusNode = FocusNode(); // Add this
  // for daily challenge
  final List<Map<String, String>> dailyChallenges = [
    {
      "name": "Prophet Muhammad\n(PBUH)",
      "desc": "The Final Messenger • 15 Questions",
      "image":
          "https://images.unsplash.com/photo-1542810634-71277d95dcbb?q=80&w=1000",
    },
    {
      "name": "Prophet Musa\n(AS)",
      "desc": "The Parting of the Sea • 12 Questions",
      "image":
          "https://images.unsplash.com/photo-1509114397022-ed747cca3f65?q=80&w=1000",
    },
    {
      "name": "Prophet Isa\n(AS)",
      "desc": "The Miracle of the Table • 10 Questions",
      "image":
          "https://images.unsplash.com/photo-1438032005730-c779502df39b?q=80&w=1000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int dayOfYear = DateTime.now()
        .difference(DateTime(DateTime.now().year, 1, 1))
        .inDays;
    var todayChallenge = dailyChallenges[dayOfYear % dailyChallenges.length];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Prophets",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              backgroundColor: Colors.white.withOpacity(0.05),
              label: const Row(
                children: [
                  Icon(Icons.stars, color: Colors.amber, size: 16),
                  Text(
                    " 1,450",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Search Bar ---
            const SizedBox(height: 10),
            TextField(
              controller: _searchController,
              focusNode: _searchFocusNode,
              autofocus: false,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              // style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF132521),
                hintText: "Search Prophet or Topic...",
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
                prefixIcon: const Icon(Icons.search, color: Colors.white38),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white38),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            searchQuery = "";
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            // --- Filter Chips ---
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip("All"),
                  _filterChip("Beginner"),
                  _filterChip("Intermediate"),
                  _filterChip("Advanced"),
                ],
              ),
            ),

            // --- Daily Challenge Card ---
            const SizedBox(height: 25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: NetworkImage(
                    todayChallenge["image"]!,
                  ), // Daily challenge image
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.emoji_events_outlined,
                          color: Colors.amber,
                          size: 14,
                        ),
                        Text(
                          " Daily Challenge",
                          style: TextStyle(
                            color: Colors.amber,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    todayChallenge["name"]!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    todayChallenge['desc']!,
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionScreen(
                            categoryName: "PROPHETS",
                            questions: QuizData.prophetQuestions,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF26A69A),
                      minimumSize: const Size(double.infinity, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Start Quiz",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // --- Quizzes List Section ---
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "All Quizzes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "View Progress",
                    style: TextStyle(color: Color(0xFF26A69A)),
                  ),
                ),
              ],
            ),

            // --- Quizzes List Section ---
            const SizedBox(height: 30),

            // Each item now includes the 'context', 'img', and 'story' arguments
            if ((activeFilter == "All" || activeFilter == "Beginner") &&
                "prophet adam".contains(searchQuery))
              _quizListItem(
                context,
                "Prophet Adam (AS)",
                "The First Man • Beginner",
                0.75,
                true,
                img:
                    "https://images.unsplash.com/photo-1509062522246-3755977927d7",
                story:
                    "Allah (SWT) created Prophet Adam (AS) from clay. He was the first human and the first Prophet...",
              ),

            if ((activeFilter == "All" || activeFilter == "Intermediate") &&
                "prophet nuh".contains(searchQuery))
              _quizListItem(
                context,
                "Prophet Nuh (AS)",
                "The Ark & The Flood • Intermediate",
                0.0,
                false,
                reward: "50 XP",
                img:
                    "https://images.unsplash.com/photo-1547303036-7c01b1b9b1e0",
                story:
                    "Prophet Nuh (AS) built a great Ark by the command of Allah to save the believers from the flood...",
              ),

            if ((activeFilter == "All" || activeFilter == "Advanced") &&
                "prophet ibrahim".contains(searchQuery))
              _quizListItem(
                context,
                "Prophet Ibrahim (AS)",
                "Father of Prophets • Advanced",
                0.0,
                false,
                reward: "100 XP",
                img:
                    "https://images.unsplash.com/photo-1508913950751-d1d139a29e68",
                story:
                    "Prophet Ibrahim (AS) was the friend of Allah. He rebuilt the Kaaba with his son Isma'il (AS)...",
              ),

            if ((activeFilter == "All" || activeFilter == "Intermediate") &&
                "prophet yusuf".contains(searchQuery))
              _quizListItem(
                context,
                "Prophet Yusuf (AS)",
                "The Dream Interpreter • Intermediate",
                0.0,
                false,
                reward: "75 XP",
                img:
                    "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b",
                story:
                    "Prophet Yusuf (AS) was known for his beauty and his ability to interpret dreams sent by Allah...",
              ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // CHANGE 4: Add GestureDetector and setState to your widget method
  Widget _filterChip(String label) {
    bool isSelected = activeFilter == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeFilter = label;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF26A69A) : const Color(0xFF132521),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.transparent : Colors.white10,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white54,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _quizListItem(
    BuildContext context,
    String title,
    String sub,
    double progress,
    bool isUnlocked, {
    String? reward,
    required String story,
    required String img,
  }) {
    return GestureDetector(
      onTap: () {
        if (isUnlocked) {
          FocusScope.of(context).unfocus();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProphetStoryPage(
                name: title,
                subtitle: sub,
                storyContent: story,
                imageUrl: img,
              ),
            ),
          );
        } else {
          // Optional: Show a "Locked" snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Complete previous levels to unlock!"),
            ),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF132521),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, color: Colors.white24),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    sub,
                    style: const TextStyle(color: Colors.white38, fontSize: 11),
                  ),
                  if (isUnlocked) ...[
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.white10,
                      color: const Color(0xFF26A69A),
                      minHeight: 4,
                    ),
                  ] else if (reward != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.bolt,
                          color: Colors.tealAccent,
                          size: 14,
                        ),
                        Text(
                          " $reward Reward",
                          style: const TextStyle(
                            color: Colors.tealAccent,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            if (isUnlocked)
              const Icon(
                Icons.play_circle_fill,
                color: Color(0xFF26A69A),
                size: 30,
              )
            else
              const Icon(Icons.lock_outline, color: Colors.white24, size: 24),
          ],
        ),
      ),
    );
  }
}
