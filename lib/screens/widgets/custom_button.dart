import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  String text;
  bool isLoading;
  CustomButton({
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16.r),
        ),
      ),
      child: isLoading
          ? CircularProgressIndicator(color: Theme.of(context).primaryColor)
          : Text(
              text,
              style: TextStyle(fontWeight: .w500, fontSize: 20.sp),
            ),
    );
  }
}
