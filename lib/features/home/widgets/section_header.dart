import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const SectionHeader({required this.title, required this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: 8),
        Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),

      ],
    );
  }
}
