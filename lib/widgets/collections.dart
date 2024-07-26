import 'package:flutter/material.dart';

class CollectionChips extends StatelessWidget {
  // collection of dart learning topics
  final List<CollectionItem> collections = [
    CollectionItem(icon: Icons.flash_on, label: 'Dart Basics'),
    CollectionItem(icon: Icons.type_specimen_sharp, label: 'Dart Datatypes'),
    CollectionItem(icon: Icons.code, label: 'Dart Functions'),
    CollectionItem(icon: Icons.list, label: 'Dart Collections'),
    CollectionItem(icon: Icons.stream, label: 'Dart Streams'),
    CollectionItem(icon: Icons.bug_report, label: 'Dart Null Safety'),
    CollectionItem(icon: Icons.widgets, label: 'Flutter Widgets'),
    CollectionItem(icon: Icons.web, label: 'Flutter Web'),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: collections
          .map((collection) => CollectionChip(item: collection))
          .toList(),
    );
  }
}

class CollectionChip extends StatelessWidget {
  final CollectionItem item;
  const CollectionChip({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Selected: ${item.label}');
      },
      child: Chip(
        backgroundColor: Colors.grey[800],
        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
        avatar: Icon(item.icon, size: 18, color: Colors.white),
        label: Text(
          item.label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}

class CollectionItem {
  final IconData icon;
  final String label;

  CollectionItem({required this.icon, required this.label});
}
