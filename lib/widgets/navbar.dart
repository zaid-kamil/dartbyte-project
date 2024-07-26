import 'package:flutter/material.dart';

class NavigationSidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.black87,
      child: const Column(
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.deepPurple,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(height: 24),
          NavItem(icon: Icons.today, label: 'Today'),
          NavItem(icon: Icons.book, label: 'Journal'),
          NavItem(
              icon: Icons.lightbulb_outline, label: 'Guides', isSelected: true),
          NavItem(icon: Icons.settings, label: 'Settings'),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'DARTBYTE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                letterSpacing: 1.2,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      preferBelow: false,
      verticalOffset: 16,
      child: Container(
        width: double.infinity,
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: isSelected ? Colors.deepPurple : Colors.transparent,
              width: 5,
            ),
          ),
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 24,
        ),
      ),
    );
  }
}
