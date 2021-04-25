import 'package:flutter/material.dart';
import 'package:india_beats_covid/themes/colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.accentColor,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.accentColor,
    );
  }
}
