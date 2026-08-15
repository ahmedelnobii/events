import 'package:events/core/theme/app_colors.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/screens/onboarding/onboarding_screen.dart';
import 'package:events/screens/onboarding/widgets/onboarding_page_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class OnboardingTextPageView extends StatefulWidget {
  OnboardingTextPageView({
    required this.pageController,
    required this.textController,
    required this.index,
    required this.onPageChanged,
  });
  PageController pageController;
  PageController textController;
  void Function(int) onPageChanged;
  int index;
  @override
  State<OnboardingTextPageView> createState() => _OnboardingTextPageViewState();
}

class _OnboardingTextPageViewState extends State<OnboardingTextPageView> {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
    return SizedBox(
      height: .3 * screenHight,
      child: PageView.builder(
        onPageChanged: (value) {
          widget.pageController.jumpTo(widget.textController.offset);
          widget.index = value;
          widget.onPageChanged(value);
          setState(() {});
        },
        controller: widget.textController,
        itemCount: OnboardingPageDetails.getOnboardingPages.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                Text(
                  OnboardingPageDetails.getOnboardingPages[index].mainText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkMainText
                        : AppColors.lightMainText,
                  ),
                ),
                Text(
                  OnboardingPageDetails.getOnboardingPages[index].secText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? AppColors.darkSecText
                        : AppColors.lightSecText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
