import 'package:flutter/material.dart';

class LocalProvider with ChangeNotifier {
  String language = 'en';

  bool get isArabic => language == 'ar';
  void changeLanguge(String langugeCode) {
    if (language == langugeCode) return;
    language = langugeCode;
    notifyListeners();
  }
}
