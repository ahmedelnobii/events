import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:firebase_core/firebase_core.dart';

class UserModel {
  String id;
  String name;
  String email;
  List<String> favEventsId = [];

  UserModel({
    required this.name,
    required this.email,
    required this.id,
    required this.favEventsId,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json['name'],
    email: json['email'],
    id: json['id'],
    favEventsId: List<String>.from(json['favEventsId'] ?? []),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'id': id,
    'favEventsId': favEventsId,
  };
}
