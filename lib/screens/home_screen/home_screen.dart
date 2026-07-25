import 'package:events/core/constants/app_icons.dart';
import 'package:events/screens/home_screen/taps/favorite/favorite_tap.dart';
import 'package:events/screens/home_screen/taps/home/home_tap.dart';
import 'package:events/screens/home_screen/taps/profile/profile_tap.dart';
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
            activeIcon: SvgPicture.asset(
              AppIcons.selectedHome,
              height: 24,
              width: 24,
            ),
            icon: SvgPicture.asset(
              AppIcons.unSelectedHome,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Favorite',
            activeIcon: SvgPicture.asset(
              AppIcons.selectedFavorite,
              height: 24,
              width: 24,
            ),
            icon: SvgPicture.asset(
              AppIcons.unSelectedFavorite,
              height: 24,
              width: 24,
            ),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            activeIcon: SvgPicture.asset(
              AppIcons.selectedProfile,
              height: 24,
              width: 24,
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
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
