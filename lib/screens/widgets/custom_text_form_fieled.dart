import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  String hint;
  Widget? suffix;
  Widget? prefix;
  Color? prefixColor;
  Color? suffixColor;
  int maxLines;
  String? Function(String?)? validator;
  bool isPassword = false;
  TextEditingController? controller;

  CustomTextFormField({
    required this.hint,
    this.suffix,
    this.prefix,
    this.suffixColor,
    this.prefixColor,
    this.maxLines = 1,
    this.isPassword = false,
    this.validator,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: isObscure,
      maxLines: widget.maxLines,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightInputField,
        hint: Text(widget.hint, style: Theme.of(context).textTheme.titleSmall),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off_rounded : Icons.visibility,
                ),
              )
            : widget.suffix,
        prefixIcon: widget.prefix,
        prefixIconColor: widget.prefixColor ?? AppColors.gray,
        suffixIconColor: widget.suffixColor ?? AppColors.gray,
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
