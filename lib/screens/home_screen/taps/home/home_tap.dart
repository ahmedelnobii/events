import 'package:events/screens/home_screen/taps/home/home_header.dart';
import 'package:events/screens/home_screen/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
        Expanded(
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: 10,
            itemBuilder: (_, _) => EventItem(),
          ),
        ),
      ],
    );
  }
}
