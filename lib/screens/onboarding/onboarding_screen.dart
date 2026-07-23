import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/onboarding/widgets/onboarding_frames_pageview.dart';
import 'package:events/screens/onboarding/widgets/onboarding_page_services.dart';
import 'package:events/screens/onboarding/widgets/onboarding_text_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const routName = '/OnboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static int index = 0;
  PageController pageController = PageController(initialPage: 0);
  PageController textController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.lightLogo, fit: .scaleDown),
        leading: Visibility(
          visible: index != 0,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: IconButton(
              onPressed: () {
                pageController.previousPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
                textController.previousPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              },
              icon: Icon(Icons.arrow_back_ios_rounded, size: 24),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.lightInputField,
                foregroundColor: AppColors.lightPrimiary,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.lightOutLinePorder),
                  borderRadius: BorderRadiusGeometry.circular(18),
                ),
              ),
            ),
          ),
        ),
        actions: [
          if (index != 2)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () {
                  pageController.jumpToPage(2);
                  textController.jumpToPage(2);
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.lightInputField,
                  foregroundColor: AppColors.lightPrimiary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.lightOutLinePorder),
                    borderRadius: BorderRadiusGeometry.circular(18),
                  ),
                ),
                child: Text('skip'),
              ),
            ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              OnboardingFramesPageview(
                index: index,
                textController: textController,
                pageController: pageController,
                onPageChanged: indexOnChange,
              ),
              //page view for frames
              SizedBox(height: 16.h),
              //page indector
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: OnboardingPageDetails.getOnboardingPages.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.lightPrimiary,
                      dotColor: AppColors.lightSecText,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              //page view for texts
              OnboardingTextPageView(
                index: index,
                textController: textController,
                pageController: pageController,
                onPageChanged: indexOnChange,
              ),
            ],
          ),
          //botton bottom
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                index == 2
                    ? {
                        setOnBoardingSharedPreferance(),
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(HomeScreen.routeName),
                      }
                    : textController.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      );
                pageController.nextPage(
                  duration: Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16.r),
                ),
              ),
              child: Text(
                index == 2 ? 'Finish ' : 'Next',
                style: TextStyle(fontWeight: .w500, fontSize: 20.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void indexOnChange(int value) {
    index = value;
    setState(() {});
  }

  void setOnBoardingSharedPreferance() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool('onboarding', true);
  }
}
