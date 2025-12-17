import 'package:flutter/material.dart';
import 'package:weather/core/theme/Colors.dart';
import 'package:weather/core/theme/fontSize.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    fontFamily: 'Cairo',
    cardColor: AppColors.lightCard,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: AppFontSize.title,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: AppFontSize.body,
      ),
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    cardColor: AppColors.darkCard,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      error: AppColors.error,
    ),
  );
}
