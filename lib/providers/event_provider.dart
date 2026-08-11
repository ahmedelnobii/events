import 'package:events/model/category_model.dart';
import 'package:events/model/event_model.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:flutter/foundation.dart';

class EventProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> displayedEvents = [];

  void getEvents() async {
    allEvents = await FirebaseServices.getEvents();
    displayedEvents = allEvents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      displayedEvents = allEvents;
    } else {
      displayedEvents = allEvents
          .where((event) => event.categoryModel == category)
          .toList();
    }
    notifyListeners();
  }
}
