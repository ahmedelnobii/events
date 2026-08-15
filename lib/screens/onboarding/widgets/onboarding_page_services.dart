import 'package:events/core/constants/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPageDetails {
  String frame;
  String darkFrame;

  String mainText;
  String secText;
  OnboardingPageDetails({
    required this.frame,
    required this.mainText,
    required this.secText,
    required this.darkFrame,
  });
  static List<OnboardingPageDetails> getOnboardingPages = [
    OnboardingPageDetails(
      darkFrame: AppImages.onboardingFrame1Dark,
      frame: AppImages.onboardingFrame1,
      mainText: 'Find Events That Inspire You',
      secText:
          'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.',
    ),
    OnboardingPageDetails(
      darkFrame: AppImages.onboardingFrame2Dark,
      frame: AppImages.onboardingFrame2,
      mainText: 'Effortless Event Planning',
      secText:
          'Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.',
    ),
    OnboardingPageDetails(
      frame: AppImages.onboardingFrame3,
      darkFrame: AppImages.onboardingFrame3Dark,
      mainText: 'Connect with Friends & Share Moments',
      secText:
          'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
    ),
  ];
  static bool isOnboardingSeen = false;
  static Future<void> getSheredPrefrences() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    isOnboardingSeen = sharedPref.getBool('onboarding') ?? false;
  }
}
