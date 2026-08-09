import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/model/category_model.dart';

class EventModel {
  String id;
  String title;
  String description;
  CategoryModel categoryModel;
  DateTime dateTime;

  EventModel({
    this.id = '',
    required this.categoryModel,
    required this.description,
    required this.title,
    required this.dateTime,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    categoryModel: CategoryModel.categories.firstWhere(
      (category) => category.id == json['categoryModel'],
    ),
    description: json['description'],
    title: json['title'],
    dateTime: (json['dateTime'] as Timestamp).toDate(),
    id: json['id'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'categoryModel': categoryModel.id,
      'dateTime': Timestamp.fromDate(dateTime),
    };
  }
}
