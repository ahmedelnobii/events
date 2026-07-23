import 'package:events/core/constants/app_icons.dart';
import 'package:events/screens/home_screen/taps/favorite_tap.dart';
import 'package:events/screens/home_screen/taps/home_tap.dart';
import 'package:events/screens/home_screen/taps/profile_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            label: 'Home',
            activeIcon: SvgPicture.asset(AppIcons.selectedHome),
            icon: SvgPicture.asset(AppIcons.unSelectedHome),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            activeIcon: SvgPicture.asset(AppIcons.selectedFavorite),
            icon: SvgPicture.asset(AppIcons.unSelectedFavorite),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            activeIcon: SvgPicture.asset(AppIcons.selectedProfile),
            icon: SvgPicture.asset(AppIcons.unSelectedProfile),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
