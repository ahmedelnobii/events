import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageBottonItem extends StatefulWidget {
  void Function() onPressed;
  String language;
  bool isActive;

  LanguageBottonItem({
    required this.onPressed,
    required this.language,
    required this.isActive,
  });

  @override
  State<LanguageBottonItem> createState() => _LanguageBottonItemState();
}

class _LanguageBottonItemState extends State<LanguageBottonItem> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed();
      },
      style: !widget.isActive
          ? ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightInputField,
              foregroundColor: AppColors.lightMainText,
            )
          : Theme.of(context).elevatedButtonTheme.style,
      child: Text(widget.language),
    );
  }
}
