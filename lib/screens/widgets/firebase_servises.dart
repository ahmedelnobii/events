import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/model/event_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class FirebaseServices {
  static CollectionReference<EventModel> getEventsCollection() =>
      FirebaseFirestore.instance
          .collection('events')
          .withConverter<EventModel>(
            fromFirestore: (snapShot, _) =>
                EventModel.fromJson(snapShot.data()!),
            toFirestore: (event, _) => event.toJson(),
          );
  static Future<void> creatEvent(EventModel event) {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    DocumentReference<EventModel> doc = eventCollection.doc();
    event.id = doc.id;
    return doc.set(event);
  }

  static Future<List<EventModel>> getEvents() async {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    QuerySnapshot<EventModel> querySnapshot = await eventCollection
        .orderBy('dateTime')
        .get();
    return querySnapshot.docs.map((snapShot) => snapShot.data()).toList();
  }
}
