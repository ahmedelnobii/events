import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/model/language_model.dart';
import 'package:events/model/user_model.dart';
import 'package:events/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserProvider>(context).user!;

    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              radius: screenWidth * .13,
              backgroundImage: AssetImage('assets/images/route_logo.png'),
            ),
          ),

          Text(user.name, style: textTheme.labelSmall),
          SizedBox(height: 5),
          Text(user.email, style: textTheme.titleSmall),
          SizedBox(height: 32),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SwitchListTile(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.lightOutLinePorder),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: AppColors.lightInputField,
                  title: Text('Dark Mode', style: textTheme.titleMedium),
                  thumbColor: WidgetStatePropertyAll(AppColors.lightInputField),
                  trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
                  trackColor: WidgetStatePropertyAll(AppColors.lightSoftGrey),
                  value: false,
                  onChanged: (_) {},
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('Language', style: textTheme.titleMedium),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.lightOutLinePorder),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: AppColors.lightInputField,
                  trailing: DropdownButton(
                    borderRadius: BorderRadius.circular(16),
                    value: 'en',
                    underline: SizedBox(),
                    items: LanguageModel.languages
                        .map(
                          (langauge) => DropdownMenuItem(
                            value: langauge.code,
                            child: Text(langauge.language),
                          ),
                        )
                        .toList(),
                    onChanged: (_) {},
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text('Logout', style: textTheme.titleMedium),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.lightOutLinePorder),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: AppColors.lightInputField,
                  trailing: InkWell(
                    onTap: () {},
                    child: SvgPicture.asset(
                      AppIcons.exite,
                      height: 24,
                      width: 24,
                      fit: .scaleDown,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
