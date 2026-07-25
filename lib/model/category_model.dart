import 'package:events/core/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String label;
  IconData icon;
  String image;

  CategoryModel({
    required this.icon,
    required this.image,
    required this.id,
    required this.label,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      icon: Icons.directions_bike_rounded,
      label: 'Sport',
      id: 'Sport',
      image: AppImages.lightSport,
    ),
    CategoryModel(
      icon: Icons.cake_outlined,
      label: 'Birthday',
      id: 'Birthday',
      image: AppImages.lightBirthday,
    ),
    CategoryModel(
      icon: CupertinoIcons.book_fill,
      label: 'Book club',
      id: 'Bookc club',
      image: AppImages.lightBookClub,
    ),
    CategoryModel(
      icon: Icons.meeting_room_outlined,
      label: 'Meeting',
      id: 'Meeting',
      image: AppImages.lightMeeting,
    ),
    CategoryModel(
      icon: Icons.photo,
      label: 'Exhibition',
      id: 'Exhibition',
      image: AppImages.lightExhibition,
    ),
  ];
}
