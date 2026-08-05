import 'package:device_preview/device_preview.dart';
import 'package:events/core/theme/app_theme.dart';
import 'package:events/screens/home_screen/add_event_screen.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/login/login_screen.dart';
import 'package:events/screens/login/register_screen.dart';
import 'package:events/screens/onboarding/onboarding_screen.dart';
import 'package:events/screens/onboarding/personlization_screen.dart';
import 'package:events/screens/onboarding/widgets/onboarding_page_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await OnboardingPageDetails.getSheredPrefrences();
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => Events()));
}

class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (_, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(),
          AddEventScreen.routeName: (context) => AddEventScreen(),
          PersonlizationScreen.routeName: (context) => PersonlizationScreen(),
          OnboardingScreen.routName: (context) => OnboardingScreen(),
          LoginScreen.routeName: (context) => LoginScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen(),
        },
        initialRoute: OnboardingPageDetails.isOnboardingSeen
            ? HomeScreen.routeName
            : PersonlizationScreen.routeName,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
