import 'package:device_preview/device_preview.dart';
import 'package:events/core/theme/app_theme.dart';
import 'package:events/screens/home_screen.dart';
import 'package:events/screens/onboarding/personlization_screen.dart';
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
  runApp(DevicePreview(enabled: !kDebugMode, builder: (context) => Events()));
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
        },
        initialRoute: PersonlizationScreen.routeName,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
