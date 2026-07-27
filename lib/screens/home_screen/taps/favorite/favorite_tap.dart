import 'package:events/screens/home_screen/widgets/event_item.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: 10,
              itemBuilder: (_, _) => EventItem(),
            ),
          ),
        ],
      ),
    );
  }
}
