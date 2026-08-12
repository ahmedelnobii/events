import 'package:events/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? user;

  void updateUser(UserModel? user) {
    this.user = user;
    notifyListeners();
  }
}
