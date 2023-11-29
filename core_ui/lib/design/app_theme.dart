import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ),
      primaryColor: AppColors.orange,
      canvasColor: AppColors.lightGrey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.orange,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
      ),
      primaryColor: AppColors.orange,
      canvasColor: AppColors.grey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.grey,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.orange,
      ),
    );
  }
}