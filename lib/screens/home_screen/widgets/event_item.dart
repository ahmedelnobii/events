import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/model/event_model.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/preview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventItem extends StatefulWidget {
  EventModel event;
  EventItem(this.event);

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    bool isFavourite = Provider.of<UserProvider>(
      context,
    ).isEventInFavorites(widget.event.id);
    double screenHeight = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(PreviewScreen.routeName, arguments: widget.event);
      },
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(16),
              child: Image.asset(
                widget.event.categoryModel.image,
                height: screenHeight * .25,
                width: double.infinity,
                fit: .fill,
              ),
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
                  DateFormat('dd MMM').format(widget.event.dateTime),
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
                decoration: BoxDecoration(
                  color: AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColors.lightMainText,
                          fontWeight: .w400,
                        ),
                        widget.event.description,
                        maxLines: 2,
                        overflow: .ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (isFavourite) {
                          userProvider.removeEventFromFavorite(widget.event.id);
                        } else {
                          userProvider.addEventToFavorite(widget.event.id);
                        }
                      },
                      icon: isFavourite
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
        ),
      ),
    );
  }
}
