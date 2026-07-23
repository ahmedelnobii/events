import 'package:device_preview/device_preview.dart';
import 'package:events/core/theme/app_theme.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/onboarding/onboarding_screen.dart';
import 'package:events/screens/onboarding/personlization_screen.dart';
import 'package:events/screens/onboarding/widgets/onboarding_page_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          PersonlizationScreen.routeName: (context) => PersonlizationScreen(),
          OnboardingScreen.routName: (context) => OnboardingScreen(),
        },
        initialRoute: OnboardingPageDetails.isOnboardingSeen
            ? HomeScreen.routeName
            : PersonlizationScreen.routeName,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
