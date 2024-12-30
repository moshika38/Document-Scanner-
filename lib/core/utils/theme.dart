import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    // fontFamily: GoogleFonts.poppins().fontFamily,
    // Text Themes
    scaffoldBackgroundColor: AppColors.bgColor, 
    cardTheme: const CardTheme(
      color: Colors.white,
      elevation: 2.0,
      shadowColor: Colors.black12,
    ),
    textTheme: const TextTheme(
      // Title style from onboarding
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.titleText,
      ),
      // Description style from onboarding
      bodyLarge: TextStyle(
        fontSize: 18,
        color: AppColors.descriptionText,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: AppColors.descriptionText,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.descriptionText,
      ),
    ),

  

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.buttonText,
        shape: const CircleBorder(),
      ),
    ),
  );
}
