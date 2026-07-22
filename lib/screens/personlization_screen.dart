import 'package:events/core/app_images.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonlizationScreen extends StatelessWidget {
  static const routeName = '/personlizationScreen';
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Image.asset(
                        AppImages.presonalizetionScreenPhoto,
                        fit: .fill,
                        height: screenHight * (343 / 812),
                        width: screenWidth * (343 / 375),
                      ),
                      SizedBox(height: 24.sp),
                      Text(
                        'Personalize Your Experience',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: .w600,
                          color: AppColors.lightMainText,
                        ),
                      ),
                      SizedBox(height: 8.sp),
                      Text(
                        'Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.lightSecText,
                          fontWeight: .w400,
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
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                spacing: 5.w,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('English'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Arabic'),
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
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Spacer(),
                              Row(
                                spacing: 5,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.sunny),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.nightlight_outlined),
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
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                  ),
                ),
                child: Text(
                  'Let\'s start',
                  style: TextStyle(fontSize: 20.sp, fontWeight: .w500),
                ),
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
