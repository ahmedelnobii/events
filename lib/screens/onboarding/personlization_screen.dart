import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/l10n/app_localizations.dart';
import 'package:events/providers/local_provider.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/screens/onboarding/onboarding_screen.dart';
import 'package:events/screens/onboarding/widgets/language_botton_item.dart';
import 'package:events/screens/onboarding/widgets/theme_bottom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonlizationScreen extends StatefulWidget {
  static const routeName = '/personlizationScreen';

  @override
  State<PersonlizationScreen> createState() => _PersonlizationScreenState();
}

class _PersonlizationScreenState extends State<PersonlizationScreen> {
  late bool isArabic;
  late bool isEn = !isArabic;
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
    double screenHight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    isArabic = Provider.of<LocalProvider>(context).isArabic;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          isDark ? AppImages.darkLogo : AppImages.lightLogo,
          fit: .scaleDown,
        ),
      ),
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
                      isDark
                          ? AppImages.darkPresonalizetionScreenPhoto
                          : AppImages.presonalizetionScreenPhoto,
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
                              alignment: .topStart,
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.personalizeYourExperience,
                                textAlign: .start,
                                style: TextStyle(
                                  fontWeight: .w600,
                                  fontSize: 20.sp,
                                  color: isDark
                                      ? AppColors.darkMainText
                                      : AppColors.lightMainText,
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
                            textAlign: .start,
                            AppLocalizations.of(
                              context,
                            )!.personalizeYourExperienceDescription,
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.darkSecText
                                  : AppColors.lightSecText,
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
                              AppLocalizations.of(context)!.language,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
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
                                  isActive: !isEn,
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
                              AppLocalizations.of(context)!.theme,

                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
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
                                  isActive: !isDark,
                                ),
                                ThemeBottomItem(
                                  onPressed: onDarkPressed,
                                  icon: Icons.nightlight_outlined,
                                  isActive: isDark,
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
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(OnboardingScreen.routName);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context)!.letsStart,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                  ),
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
    isEn = true;
    Provider.of<LocalProvider>(context, listen: false).changeLanguge('en');
    setState(() {});
  }

  void onArabicPressed() {
    isEn = false;
    Provider.of<LocalProvider>(context, listen: false).changeLanguge('ar');
    setState(() {});
  }

  void onlightPressed() {
    Provider.of<ThemeProvider>(context, listen: false).changeTheme(.light);
    setState(() {});
  }

  void onDarkPressed() {
    Provider.of<ThemeProvider>(context, listen: false).changeTheme(.dark);
    setState(() {});
  }
}
