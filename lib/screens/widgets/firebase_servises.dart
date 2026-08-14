import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/model/event_model.dart';
import 'package:events/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  static Future<void> deleteEvent(String eventID) {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    DocumentReference<EventModel> doc = eventCollection.doc(eventID);
    return doc.delete();
  }

  static Future<void> updateEvent(EventModel event) {
    CollectionReference<EventModel> eventCollection = getEventsCollection();
    DocumentReference<EventModel> doc = eventCollection.doc(event.id);
    return doc.update(event.toJson());
  }

  static CollectionReference<UserModel> getUsersCollection() =>
      FirebaseFirestore.instance
          .collection('Users')
          .withConverter<UserModel>(
            fromFirestore: (snapShot, _) =>
                UserModel.fromJson(snapShot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );
  static Future<UserModel?> login({
    required String email,
    required String password,
  }) async {
    CollectionReference<UserModel> collection = getUsersCollection();
    var credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    DocumentReference<UserModel> doc = collection.doc(credential.user!.uid);
    DocumentSnapshot<UserModel> snapShot = await doc.get();
    return snapShot.data();
  }

  static Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  }) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    UserModel user = UserModel(
      name: name,
      email: email,
      id: credential.user!.uid,
      favEventsId: [],
    );
    CollectionReference<UserModel> collection = getUsersCollection();
    await collection.doc(user.id).set(user);
    return user;
  }

  // add fav remotly in database
  static Future<void> addEventToFavorite(String eventID) {
    var collection = getUsersCollection();
    var doc = collection.doc(FirebaseAuth.instance.currentUser!.uid);
    return doc.update({
      'favEventsId': FieldValue.arrayUnion([eventID]),
    });
  }

  static Future<void> removeEventFromFavorite(String eventID) async {
    var collection = getUsersCollection();
    var doc = collection.doc(FirebaseAuth.instance.currentUser!.uid);
    return doc.update({
      'favEventsId': FieldValue.arrayRemove([eventID]),
    });
  }

  static Future<void> logout() => FirebaseAuth.instance.signOut();
}
