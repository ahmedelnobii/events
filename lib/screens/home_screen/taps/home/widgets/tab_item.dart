import 'package:events/core/theme/app_colors.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabItem extends StatelessWidget {
  IconData icon;
  String label;
  bool isSelected;
  TabItem({required this.icon, required this.label, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context).isDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? (Theme.of(context).primaryColor)
            : (isDark ? AppColors.darkInputField : AppColors.lightInputField),
        border: Border.all(
          color: isDark
              ? (isSelected ? Colors.transparent : AppColors.darkOutLinePorder)
              : AppColors.lightOutLinePorder,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? AppColors.lightInputField
                : Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: isSelected
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightInputField,
                  )
                : Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
