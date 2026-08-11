import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:events/model/event_model.dart';
import 'package:events/providers/event_provider.dart';
import 'package:events/screens/home_screen/taps/home/home_header.dart';
import 'package:events/screens/home_screen/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTap extends StatefulWidget {
  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late EventProvider eventProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventProvider.getEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    eventProvider = Provider.of<EventProvider>(context);
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: eventProvider.displayedEvents.length,
            itemBuilder: (_, index) =>
                EventItem(eventProvider.displayedEvents[index]),
          ),
        ),
      ],
    );
  }
}
