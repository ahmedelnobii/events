import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventItem extends StatefulWidget {
  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  bool liked = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Image.asset(
          AppImages.lightSport,
          height: screenHeight * .23,
          width: double.infinity,
          fit: .cover,
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.lightBackground,
            ),

            child: Text(
              '13 Jul',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: .w600,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(color: AppColors.lightBackground),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.lightMainText,
                      fontWeight: .w400,
                    ),
                    'Meeting for Updating The Development Method Meeting for Updating The Development MethodMeeting for Updating The Development MethodMeeting for Updating The Development Method',
                    maxLines: 2,
                    overflow: .ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                  icon: liked
                      ? Icon(
                          CupertinoIcons.heart_fill,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          CupertinoIcons.heart,
                          color: Theme.of(context).primaryColor,
                        ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
