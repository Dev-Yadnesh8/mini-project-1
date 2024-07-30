import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/colors/app_colors.dart';

/// Custom Class for Light & Dark Text Themes
class MTextTheme {
  MTextTheme._(); // To avoid creating instances

  // Method to get text style
  static TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
    return GoogleFonts.poppins(fontSize: fontSize, fontWeight: fontWeight, color: color);
  }

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: _getTextStyle(32.0, FontWeight.bold, AppColors.dark),
    headlineMedium: _getTextStyle(24.0, FontWeight.w600, AppColors.dark),
    headlineSmall: _getTextStyle(18.0, FontWeight.w600, AppColors.dark),

    titleLarge: _getTextStyle(16.0, FontWeight.w600, AppColors.dark),
    titleMedium: _getTextStyle(16.0, FontWeight.w500, AppColors.dark),
    titleSmall: _getTextStyle(16.0, FontWeight.w400, AppColors.dark),

    bodyLarge: _getTextStyle(14.0, FontWeight.w500, AppColors.dark),
    bodyMedium: _getTextStyle(14.0, FontWeight.normal, AppColors.dark),
    bodySmall: _getTextStyle(14.0, FontWeight.w500, AppColors.dark.withOpacity(0.5)),

    labelLarge: _getTextStyle(12.0, FontWeight.normal, AppColors.dark),
    labelMedium: _getTextStyle(12.0, FontWeight.normal, AppColors.dark.withOpacity(0.5)),
    displayLarge: _getTextStyle(42.0, FontWeight.w600, AppColors.dark),
  );

  /// Customizable Dark Text Theme
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: _getTextStyle(32.0, FontWeight.bold, AppColors.light),
    headlineMedium: _getTextStyle(24.0, FontWeight.w600, AppColors.light),
    headlineSmall: _getTextStyle(18.0, FontWeight.w600, AppColors.light),

    titleLarge: _getTextStyle(16.0, FontWeight.w600, AppColors.light),
    titleMedium: _getTextStyle(16.0, FontWeight.w500, AppColors.light),
    titleSmall: _getTextStyle(16.0, FontWeight.w400, AppColors.light),

    bodyLarge: _getTextStyle(14.0, FontWeight.w500, AppColors.light),
    bodyMedium: _getTextStyle(14.0, FontWeight.normal, AppColors.light),
    bodySmall: _getTextStyle(14.0, FontWeight.w500, AppColors.light.withOpacity(0.5)),

    labelLarge: _getTextStyle(12.0, FontWeight.normal, AppColors.light),
    labelMedium: _getTextStyle(12.0, FontWeight.normal, AppColors.light.withOpacity(0.5)),
    displayLarge: _getTextStyle(42.0, FontWeight.w600, AppColors.light),
  );
}
