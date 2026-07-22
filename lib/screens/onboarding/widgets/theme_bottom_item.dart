import 'package:events/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeBottomItem extends StatefulWidget {
  void Function() onPressed;
  IconData icon;
  bool isActive;

  ThemeBottomItem({
    required this.onPressed,
    required this.icon,
    required this.isActive,
  });

  @override
  State<ThemeBottomItem> createState() => _ThemeBottomItem();
}

class _ThemeBottomItem extends State<ThemeBottomItem> {
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
      child: Icon(widget.icon),
    );
  }
}
