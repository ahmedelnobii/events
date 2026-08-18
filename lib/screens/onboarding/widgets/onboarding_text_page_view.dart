import 'package:events/core/constants/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/l10n/app_localizations.dart';
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
  late AppLocalizations l10n;
  late List<OnboardingPageDetails> getOnboardingPages = [
    OnboardingPageDetails(
      darkFrame: AppImages.onboardingFrame1Dark,
      frame: AppImages.onboardingFrame1,
      mainText: l10n.findEventsThatInspireYou,
      secText: l10n.findEventsThatInspireYouDescription,
    ),
    OnboardingPageDetails(
      darkFrame: AppImages.onboardingFrame2Dark,
      frame: AppImages.onboardingFrame2,
      mainText: l10n.effortlessEventPlanning,
      secText: l10n.effortlessEventPlanningDescription,
    ),
    OnboardingPageDetails(
      frame: AppImages.onboardingFrame3,
      darkFrame: AppImages.onboardingFrame3Dark,
      mainText: l10n.connectWithFriendsAndShareMoments,
      secText: l10n.connectWithFriendsAndShareMomentsDescription,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
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
        itemCount: getOnboardingPages.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8.h,
              children: [
                Text(
                  getOnboardingPages[index].mainText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkMainText
                        : AppColors.lightMainText,
                  ),
                ),
                Text(
                  getOnboardingPages[index].secText,
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
