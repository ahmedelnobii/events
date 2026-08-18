import 'package:events/core/constants/app_icons.dart';
import 'package:events/l10n/app_localizations.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/screens/home_screen/add_event_screen.dart';
import 'package:events/screens/home_screen/taps/favorite/favorite_tap.dart';
import 'package:events/screens/home_screen/taps/home/home_tap.dart';
import 'package:events/screens/home_screen/taps/profile/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> taps = [HomeTap(), FavoriteTap(), ProfileTap()];
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
    return Scaffold(
      body: taps[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.home,
            activeIcon: SvgPicture.asset(
              AppIcons.selectedHome,
              height: 24,
              width: 24,
              colorFilter: isDark
                  ? ColorFilter.mode(Theme.of(context).primaryColor, .srcIn)
                  : null,
            ),
            icon: SvgPicture.asset(
              AppIcons.unSelectedHome,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.favorite,
            activeIcon: SvgPicture.asset(
              AppIcons.selectedFavorite,
              height: 24,
              width: 24,
              colorFilter: isDark
                  ? ColorFilter.mode(Theme.of(context).primaryColor, .srcIn)
                  : null,
            ),
            icon: SvgPicture.asset(
              AppIcons.unSelectedFavorite,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: AppLocalizations.of(context)!.profile,
            activeIcon: SvgPicture.asset(
              AppIcons.selectedProfile,
              height: 24,
              width: 24,
              colorFilter: isDark
                  ? ColorFilter.mode(Theme.of(context).primaryColor, .srcIn)
                  : null,
            ),
            icon: SvgPicture.asset(
              AppIcons.unSelectedProfile,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEventScreen.routeName);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
