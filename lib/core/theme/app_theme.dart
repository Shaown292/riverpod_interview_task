import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app_color.dart';

/// Current theme mode provider (Light/Dark/System)
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

/// Light theme
final lightThemeProvider = Provider<ThemeData>((ref) {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: AppColors.accentBlue,
    colorScheme: ColorScheme.light(
      primary: AppColors.accentBlue,
      secondary: AppColors.accentOrange,
      background: AppColors.background,
      surface: Colors.white,
      onPrimary: Colors.white,
      onBackground: AppColors.textPrimary,
      onSurface: AppColors.textPrimary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
    ),
  );
});

/// Dark theme auto-generated variation
final darkThemeProvider = Provider<ThemeData>((ref) {
  return ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.dark(
      primary: AppColors.accentBlue,
      secondary: AppColors.accentOrange,
    ),
  );
});
