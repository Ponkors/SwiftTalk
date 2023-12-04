import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ),
      primaryColor: AppColors.blue,
      canvasColor: AppColors.lightGrey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        unselectedItemColor: AppColors.grey,
        selectedItemColor: AppColors.black,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
      ),
      primaryColor: AppColors.blue,
      canvasColor: AppColors.grey,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.grey,
        unselectedItemColor: AppColors.white,
        selectedItemColor: AppColors.black,
      ),
    );
  }
}