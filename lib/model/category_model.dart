import 'package:events/core/constants/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String label;
  IconData icon;
  String image;
  String darkImage;

  CategoryModel({
    required this.icon,
    required this.image,
    required this.id,
    required this.label,
    required this.darkImage,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      icon: Icons.directions_bike_rounded,
      label: 'Sport',
      id: 'Sport',
      image: AppImages.lightSport,
      darkImage: AppImages.darkSport,
    ),
    CategoryModel(
      icon: Icons.cake_outlined,
      label: 'Birthday',
      id: 'Birthday',
      image: AppImages.lightBirthday,
      darkImage: AppImages.darkBirthday,
    ),
    CategoryModel(
      icon: CupertinoIcons.book_fill,
      label: 'Book club',
      id: 'Bookc club',
      image: AppImages.lightBookClub,
      darkImage: AppImages.darkBirthday,
    ),
    CategoryModel(
      icon: Icons.meeting_room_outlined,
      label: 'Meeting',
      id: 'Meeting',
      image: AppImages.lightMeeting,
      darkImage: AppImages.darkMeeting,
    ),
    CategoryModel(
      icon: Icons.photo,
      label: 'Exhibition',
      id: 'Exhibition',
      image: AppImages.lightExhibition,
      darkImage: AppImages.darkExhibition,
    ),
  ];
}
