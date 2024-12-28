import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,

    // Text Themes
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

    // Icon Theme
    iconTheme: const IconThemeData(
      size: 100,
      color: AppColors.primary,
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
