import 'package:flutter/material.dart';

class RecommendedGuidesGrid extends StatelessWidget {
  final List<GuideItem> guides = [
    GuideItem(
      title: 'Collections in Dart',
      author: 'Zaid Kamil',
      description:
          'Learn how to work with collections in Dart, including lists, sets, and maps',
      color: Colors.deepOrange,
      tags: ['DART', 'COLLECTIONS', 'LISTS'],
    ),
    GuideItem(
      title: 'Flutter State Management',
      author: 'Bharvi Sharma',
      description:
          'Understand the different state management techniques in Flutter',
      color: Colors.purple,
      tags: ['FLUTTER', 'STATE MANAGEMENT'],
    ),
    GuideItem(
      title: 'Dart Null Safety',
      author: 'Noor ul Aman',
      description: 'Migrate your Dart code to use null safety features',
      color: Colors.blue,
      tags: ['DART', 'NULL SAFETY'],
    ),
    GuideItem(
      title: 'Dart Streams',
      author: "Amna Ghazal",
      description: 'Learn how to work with streams in Dart',
      color: Colors.green,
      tags: ['DART', 'STREAMS'],
    ),
    GuideItem(
      title: 'Flutter Animations',
      author: "Akbar Ahmad",
      description: 'Create beautiful animations in Flutter',
      color: Colors.pink,
      tags: ['FLUTTER', 'ANIMATIONS'],
    ),
  ];

  RecommendedGuidesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        childAspectRatio: 0.8,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: guides.length,
      itemBuilder: (context, index) {
        return GuideCard(guide: guides[index]);
      },
    );
  }
}

class GuideCard extends StatelessWidget {
  final GuideItem guide;

  const GuideCard({Key? key, required this.guide}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: guide.color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              guide.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Text(
                    guide.author.substring(0, 1),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  guide.author,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                guide.description,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: guide.tags.map((tag) => Tag(text: tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class Tag extends StatelessWidget {
  final String text;

  const Tag({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class GuideItem {
  final String title;
  final String author;
  final String description;
  final Color color;
  final List<String> tags;

  GuideItem({
    required this.title,
    required this.author,
    required this.description,
    required this.color,
    required this.tags,
  });
}
