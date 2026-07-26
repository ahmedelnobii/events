import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;
  Icon? suffix;
  Icon? prefix;
  CustomTextFormField({required this.hint, this.suffix, this.prefix});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        fillColor: AppColors.lightInputField,
        hint: Text(hint),
        suffixIcon: suffix,
        prefixIcon: prefix,
        prefixIconColor: AppColors.lightHintText,
        suffixIconColor: AppColors.lightHintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightOutLinePorder),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightOutLinePorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.lightOutLinePorder),
        ),
      ),
    );
  }
}
