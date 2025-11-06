import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
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
    textTheme:  TextTheme(
      bodyLarge: GoogleFonts.inter(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w700
      ),
      bodyMedium: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500
      ),
      bodySmall: GoogleFonts.inter(
          color: AppColors.textPrimary,
          fontSize: 14
      ),
      labelMedium: GoogleFonts.inter(
          color: AppColors.textPrimary.withOpacity(0.6),
          fontSize: 12,
        
      ),
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
