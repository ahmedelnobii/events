import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.lightPrimiary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimiary,
        foregroundColor: AppColors.lightInputField,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: AppColors.lightBackground,
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
      shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
    ),

    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w400,
        color: AppColors.lightSecText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: .w400,
        color: AppColors.lightMainText,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: AppColors.lightMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        color: AppColors.lightMainText,
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        fontWeight: .w600,
        color: AppColors.lightPrimiary,
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    primaryColor: AppColors.darkPrimiary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimiary,
        foregroundColor: AppColors.darkMainText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: AppColors.darkBackground,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: AppColors.darkBackground,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      unselectedItemColor: AppColors.gray,
      selectedItemColor: AppColors.darkPrimiary,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: AppColors.darkBackground,
      backgroundColor: AppColors.darkPrimiary,
      foregroundColor: AppColors.darkMainText,
      shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
    ),

    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: .w400,
        color: AppColors.darkSecText,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: .w400,
        color: AppColors.darkMainText,
      ),
      titleLarge: TextStyle(
        fontSize: 18,
        fontWeight: .w500,
        color: AppColors.darkMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 20,
        fontWeight: .w500,
        color: AppColors.darkMainText,
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        fontWeight: .w600,
        color: AppColors.darkPrimiary,
      ),
    ),
  );
}
