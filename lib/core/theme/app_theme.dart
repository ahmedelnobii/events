import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.lightBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimiary,
        foregroundColor: AppColors.lightInputField,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: AppColors.lightMainText,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightInputField,
      unselectedItemColor: AppColors.gray,
      selectedItemColor: AppColors.lightPrimiary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.lightPrimiary,
      backgroundColor: AppColors.lightPrimiary,
      foregroundColor: AppColors.lightInputField,
      shape: CircleBorder(side: BorderSide(style: BorderStyle.solid)),
    ),
  );
}
