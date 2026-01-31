import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  Category({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AllCategoriesScreenState createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  final List<Category> _allCategories = [
    Category(
      id: 'quran',
      title: 'Quran',
      subtitle: 'Recitations & Tafsir',
      icon: Icons.menu_book,
      color: Colors.teal,
    ),
    Category(
      id: 'hadith',
      title: 'Hadith',
      subtitle: 'Prophetic traditions',
      icon: Icons.record_voice_over,
      color: Colors.deepOrange,
    ),
    Category(
      id: 'prayers',
      title: 'Prayers',
      subtitle: 'Duas & Supplications',
      icon: Icons.volunteer_activism,
      color: Colors.indigo,
    ),
    Category(
      id: 'seerah',
      title: 'Seerah',
      subtitle: 'Life of the Prophet',
      icon: Icons.person,
      color: Colors.brown,
    ),
    Category(
      id: 'fiqh',
      title: 'Fiqh',
      subtitle: 'Islamic jurisprudence',
      icon: Icons.gavel,
      color: Colors.purple,
    ),
    Category(
      id: 'history',
      title: 'History',
      subtitle: 'Islamic history',
      icon: Icons.history_edu,
      color: Colors.blueGrey,
    ),
  ];

  String _query = '';

  List<Category> get _filtered => _allCategories
      .where((c) => c.title.toLowerCase().contains(_query.toLowerCase()))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Categories')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search categories',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _filtered.length,
              itemBuilder: (context, index) {
                final c = _filtered[index];
                return _CategoryCard(
                  category: c,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CategoryDetailScreen(category: c),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const _CategoryCard({ required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final color = category.color;
    return Material(
      color: color.withValues(alpha: 0.12),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: Icon(category.icon, color: Colors.white),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      category.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(category.icon, size: 88, color: category.color),
            const SizedBox(height: 16),
            Text(category.subtitle, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            const Text(
              'This is a placeholder detail screen. Replace with real content (lists, resources, lessons) for the selected category.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
