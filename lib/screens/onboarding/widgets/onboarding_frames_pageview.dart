import 'package:events/screens/home_screen/home_screen.dart';
import 'package:events/screens/onboarding/widgets/onboarding_page_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingFramesPageview extends StatefulWidget {
  OnboardingFramesPageview({
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
  State<OnboardingFramesPageview> createState() =>
      _OnboardingFramesPageviewState();
}

class _OnboardingFramesPageviewState extends State<OnboardingFramesPageview> {
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: screenHight * .43,
      child: PageView.builder(
        controller: widget.pageController,
        itemCount: OnboardingPageDetails.getOnboardingPages.length,
        onPageChanged: (value) {
          widget.textController.jumpTo(widget.pageController.offset);
          widget.index = value;
          widget.onPageChanged(value);
          setState(() {});
        },
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: screenHight * (350 / 812),
            child: Image.asset(
              OnboardingPageDetails.getOnboardingPages[index].frame,
            ),
          ),
        ),
      ),
    );
  }
}
