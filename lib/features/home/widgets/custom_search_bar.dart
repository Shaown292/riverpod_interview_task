import 'package:flutter/material.dart';
import 'package:riverpod_interview_task/core/theme/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.textPrimary.withOpacity(0.7),),
        suffixIcon: Icon(Icons.filter),
        hintText: "Search for medicines",
        hintStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(
          color: AppColors.greyLight
        )),
        contentPadding: EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide()),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(
          color: AppColors.greyLight,
        )),

      ),
    );
  }
}
