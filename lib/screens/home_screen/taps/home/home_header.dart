import 'package:events/l10n/app_localizations.dart';
import 'package:events/model/category_model.dart';
import 'package:events/model/event_model.dart';
import 'package:events/model/user_model.dart';
import 'package:events/providers/event_provider.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/home_screen/taps/home/widgets/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

//enum Labels { sport, bookclub, birthday, exhibition, meeting }

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;
  late AppLocalizations local;
  String? titleByLabels(String label) {
    switch (label) {
      case 'Sport':
        return local.sport;
      case 'Book club':
        return local.bookclub;
      case 'Birthday':
        return local.birthday;
      case 'Exhibition':
        return local.exhibition;
      case 'Meeting':
        return local.meeting;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).user!;
    local = AppLocalizations.of(context)!;
    return SafeArea(
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Text(
                  '${local.welcomeback} ✨',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: 4),
                Text(user.name, style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          DefaultTabController(
            length: CategoryModel.categories.length + 1,
            child: TabBar(
              isScrollable: true,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: .start,
              labelPadding: EdgeInsets.symmetric(horizontal: 4),
              padding: EdgeInsets.only(left: 16),
              onTap: (value) {
                if (value == currentIndex) return;
                currentIndex = value;
                Provider.of<EventProvider>(context, listen: false).filterEvents(
                  currentIndex == 0
                      ? null
                      : CategoryModel.categories[currentIndex - 1],
                );
                setState(() {});
              },
              tabs: [
                TabItem(
                  icon: Icons.window_rounded,
                  label: local.all,
                  isSelected: currentIndex == 0,
                ),
                ...CategoryModel.categories.map(
                  (catigory) => TabItem(
                    icon: catigory.icon,
                    label: titleByLabels(catigory.label) ?? catigory.label,
                    isSelected:
                        currentIndex ==
                        CategoryModel.categories.indexOf(catigory) + 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
