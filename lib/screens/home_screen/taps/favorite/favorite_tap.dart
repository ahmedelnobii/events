import 'package:events/model/event_model.dart';
import 'package:events/providers/event_provider.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/widgets/event_item.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTap extends StatefulWidget {
  @override
  State<FavoriteTap> createState() => _FavoriteTapState();
}

class _FavoriteTapState extends State<FavoriteTap> {
  @override
  Widget build(BuildContext context) {
    List<EventModel> allevents = Provider.of<EventProvider>(context).allEvents;
    List<EventModel> FavoriteList = Provider.of<UserProvider>(context)
        .user!
        .favEventsId
        .map((eventID) {
          return allevents.firstWhere((event) => eventID == event.id);
        })
        .toList();
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: CustomTextFormField(
              hint: 'Search for event',
              suffix: Icon(CupertinoIcons.search),
              suffixColor: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (_, _) => SizedBox(height: 10),
              itemCount: FavoriteList.length,
              itemBuilder: (_, index) => EventItem(FavoriteList[index]),
            ),
          ),
        ],
      ),
    );
  }
}
