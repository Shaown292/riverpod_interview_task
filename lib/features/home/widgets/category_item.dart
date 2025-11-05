import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const CategoryItem({required this.icon, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 26, backgroundColor: Colors.orange, child: Icon(icon, color: Colors.white)),
        SizedBox(height: 6),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
