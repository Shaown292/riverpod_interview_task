import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_interview_task/core/theme/app_color.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  const CategoryItem({required this.icon, required this.title, super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            decoration: BoxDecoration(
              gradient: isSelected ?  LinearGradient(
                colors: [AppColors.accentOrange.withOpacity(0.55), AppColors.accentOrange],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ) : null,
              color: isSelected ? null : Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: FaIcon(icon, color: isSelected ? Colors.white : AppColors.accentOrange, size: 40,),
            ),
          ),
        ),
        SizedBox(height: 5,),
        SizedBox(
          width: 90,
            child: Text(title))
      ],
    );
  }
}
