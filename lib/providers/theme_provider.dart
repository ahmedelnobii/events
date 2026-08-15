import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode currentTheme = .light;

  bool get isDark => currentTheme == .dark;

  void changeTheme(ThemeMode theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
