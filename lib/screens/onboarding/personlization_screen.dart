import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/screens/onboarding/onboarding_screen.dart';
import 'package:events/screens/onboarding/widgets/language_botton_item.dart';
import 'package:events/screens/onboarding/widgets/theme_bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonlizationScreen extends StatefulWidget {
  static const routeName = '/personlizationScreen';

  @override
  State<PersonlizationScreen> createState() => _PersonlizationScreenState();
}

class _PersonlizationScreenState extends State<PersonlizationScreen> {
  bool isLightTheme = true;
  late bool isDarkTheme = !isLightTheme;

  bool isEn = true;
  late bool isAr = !isEn;

  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(title: Image.asset(AppImages.lightLogo, fit: .scaleDown)),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    Image.asset(
                      AppImages.presonalizetionScreenPhoto,
                      fit: .contain,
                      height: screenHight * (343 / 812),
                      width: screenWidth * (343 / 375),
                    ),
                    SizedBox(height: 24.h),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: .start,
                        children: [
                          Expanded(
                            flex: 7,
                            child: FittedBox(
                              alignment: .centerLeft,
                              child: Text(
                                'Personalize Your Experience',
                                textAlign: .start,
                                style: TextStyle(
                                  fontWeight: .w600,
                                  fontSize: 20.sp,
                                  color: AppColors.lightMainText,
                                ),
                              ),
                            ),
                          ),
                          Spacer(flex: 2),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Expanded(
                      flex: 9,
                      child: FittedBox(
                        alignment: .centerLeft,
                        fit: .contain,
                        child: SizedBox(
                          width: screenWidth * .76,
                          child: Text(
                            'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                            style: TextStyle(
                              color: AppColors.lightSecText,
                              fontWeight: .w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Language',
                              style: TextStyle(
                                color: AppColors.lightPrimiary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Row(
                              spacing: 5,
                              children: [
                                LanguageBottonItem(
                                  isActive: isEn,
                                  onPressed: onEnglishPressed,
                                  language: 'English',
                                ),
                                LanguageBottonItem(
                                  isActive: isAr,
                                  onPressed: onArabicPressed,
                                  language: 'Arabic',
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          children: [
                            Text(
                              'Theme',

                              style: TextStyle(
                                color: AppColors.lightPrimiary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Spacer(),
                            Row(
                              spacing: 5,
                              children: [
                                ThemeBottomItem(
                                  onPressed: onlightPressed,
                                  icon: Icons.sunny,
                                  isActive: isLightTheme,
                                ),
                                ThemeBottomItem(
                                  onPressed: onDarkPressed,
                                  icon: Icons.nightlight_outlined,
                                  isActive: isDarkTheme,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(OnboardingScreen.routName);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                  ),
                ),
                child: Text(
                  'Let\'s start',
                  style: TextStyle(fontWeight: .w500, fontSize: 20.sp),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  void onEnglishPressed() {
    isAr = false;
    isEn = true;
    setState(() {});
  }

  void onArabicPressed() {
    isAr = true;
    isEn = false;
    setState(() {});
  }

  void onlightPressed() {
    isDarkTheme = false;
    isLightTheme = true;
    setState(() {});
  }

  void onDarkPressed() {
    isDarkTheme = true;
    isLightTheme = false;
    setState(() {});
  }
}
