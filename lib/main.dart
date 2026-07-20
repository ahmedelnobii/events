import 'package:events/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Events());
}

class Events extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName :(context) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}

