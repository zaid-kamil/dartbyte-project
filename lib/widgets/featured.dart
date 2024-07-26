import 'package:flutter/material.dart';

class FeaturedGuidesGrid extends StatelessWidget {
  final List<FeaturedGuideItem> guides = [
    // featured Dart topics
    FeaturedGuideItem(
      title: 'Asynchronous Programming: Streams',
      author: 'Dart Team',
      description:
          'Learn how to work with streams to handle a sequence of asynchronous events.',
      color: Colors.green[300]!,
      tags: ['DART', 'FLUTTER'],
      duration: '60',
    ),
    FeaturedGuideItem(
      title: 'Write command line apps',
      author: 'Zaid Kamil',
      description:
          'Learn how to write Dart command-line apps with the args package.',
      color: Colors.teal[300]!,
      tags: ['DART', 'CLI'],
      duration: '45',
    ),
    FeaturedGuideItem(
      title: 'Write HTTP clients & servers',
      author: 'Bharvi Sharma',
      description:
          'Learn how to write HTTP clients and servers with the http package.',
      color: Colors.blue[300]!,
      tags: ['DART', 'HTTP'],
      duration: '90',
    ),
    FeaturedGuideItem(
      title: 'Write web apps with Flutter',
      author: "Akbar Ahmad",
      description:
          'Learn how to write web apps with Flutter and deploy them to the web.',
      color: Colors.purple[300]!,
      tags: ['FLUTTER', 'WEB'],
      duration: '120',
    ),
    FeaturedGuideItem(
      title: 'Fetch data from REST APIs',
      author: "Zaid Kamil",
      description:
          'Learn how to fetch data from REST APIs using the http package.'
          'You will learn how to make GET, POST, PUT, and DELETE requests.',
      color: Colors.orange[300]!,
      tags: ['DART', 'HTTP'],
      duration: '120',
    ),
  ];

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
        return FeaturedGuideCard(guide: guides[index]);
      },
    );
  }
}

class FeaturedGuideCard extends StatelessWidget {
  final FeaturedGuideItem guide;

  const FeaturedGuideCard({super.key, required this.guide});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: const Text('FEATURED',
                      style: TextStyle(fontSize: 10, color: Colors.white)),
                  backgroundColor: Colors.black.withOpacity(0.3),
                  padding: EdgeInsets.zero,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        color: Colors.white, size: 16),
                    const SizedBox(width: 4),
                    Text('${guide.duration} min',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              guide.title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  child: Text(guide.author.substring(0, 1),
                      style:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 8),
                Text(guide.author,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(guide.description,
                  style: const TextStyle(color: Colors.white, fontSize: 14)),
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
      child:
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
    );
  }
}

class FeaturedGuideItem {
  final String title;
  final String author;
  final String description;
  final Color color;
  final List<String> tags;
  final String duration;

  FeaturedGuideItem({
    required this.title,
    required this.author,
    required this.description,
    required this.color,
    required this.tags,
    required this.duration,
  });
}
