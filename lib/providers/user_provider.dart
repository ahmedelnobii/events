import 'package:events/model/user_model.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? user;

  void updateUser(UserModel? user) {
    this.user = user;
    notifyListeners();
  }

  bool isEventInFavorites(String eventID) =>
      user!.favEventsId.contains(eventID);

  void addEventToFavorite(String eventID) async {
    await FirebaseServices.addEventToFavorite(eventID);
    user!.favEventsId.add(eventID);
    notifyListeners();
  }

  void removeEventFromFavorite(String eventID) async {
    await FirebaseServices.removeEventFromFavorite(eventID);
    user!.favEventsId.remove(eventID);
    notifyListeners();
  }
}
