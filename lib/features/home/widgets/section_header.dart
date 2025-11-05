import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const SectionHeader({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
        SizedBox(height: 8),
      ],
    );
  }
}
