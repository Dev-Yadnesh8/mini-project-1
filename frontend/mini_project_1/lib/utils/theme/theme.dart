import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project_1/utils/constants/colors/app_colors.dart';
import 'package:mini_project_1/utils/custom_themes/text_theme.dart';


class AppTheme{
  AppTheme._(); // making the constructor private

static ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  fontFamily: GoogleFonts.poppins().fontFamily,
  primaryColor: AppColors.primary,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: MTextTheme.lightTextTheme,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
   backgroundColor: AppColors.primary,
  )

);
static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    fontFamily: GoogleFonts.poppins().fontFamily,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: MTextTheme.darkTextTheme,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
)
);
}