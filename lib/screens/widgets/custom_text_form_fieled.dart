import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String hint;
  Icon? suffix;
  Icon? prefix;
  Color? prefixColor;
  Color? suffixColor;
  int maxLines;
  CustomTextFormField({
    required this.hint,
    this.suffix,
    this.prefix,
    this.suffixColor,
    this.prefixColor,
    this.maxLines = 1,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightInputField,
        hint: Text(hint, style: Theme.of(context).textTheme.titleSmall),
        suffixIcon: suffix,
        prefixIcon: prefix,
        prefixIconColor: prefixColor ?? AppColors.lightHintText,
        suffixIconColor: suffixColor ?? AppColors.lightHintText,
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
