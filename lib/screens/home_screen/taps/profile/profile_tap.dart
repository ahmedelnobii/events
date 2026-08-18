import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/l10n/app_localizations.dart';
import 'package:events/model/language_model.dart';
import 'package:events/model/user_model.dart';
import 'package:events/providers/local_provider.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/providers/user_provider.dart';
import 'package:events/screens/login/login_screen.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var local = AppLocalizations.of(context)!;

    UserModel user = Provider.of<UserProvider>(context).user!;
    bool isDark = Provider.of<ThemeProvider>(context).isDark;
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
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkOutLinePorder
                          : AppColors.lightOutLinePorder,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  title: Text(local.darkMode, style: textTheme.titleMedium),
                  thumbColor: WidgetStatePropertyAll(AppColors.lightInputField),
                  trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
                  trackColor: WidgetStatePropertyAll(
                    isDark ? AppColors.darkPrimiary : AppColors.lightSoftGrey,
                  ),
                  value: isDark,
                  onChanged: (_) {
                    if (isDark) {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).changeTheme(.light);
                    } else {
                      Provider.of<ThemeProvider>(
                        context,
                        listen: false,
                      ).changeTheme(.dark);
                    }
                  },
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text(local.language, style: textTheme.titleMedium),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkOutLinePorder
                          : AppColors.lightOutLinePorder,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  trailing: DropdownButton(
                    dropdownColor: isDark ? AppColors.darkPrimiary : null,
                    borderRadius: BorderRadius.circular(16),
                    value: Provider.of<LocalProvider>(context).language,
                    underline: SizedBox(),
                    items: LanguageModel.languages
                        .map(
                          (langauge) => DropdownMenuItem(
                            value: langauge.code,
                            child: Text(langauge.language),
                          ),
                        )
                        .toList(),
                    onChanged: (code) {
                      Provider.of<LocalProvider>(
                        context,
                        listen: false,
                      ).changeLanguge(code!);
                    },
                  ),
                ),
                SizedBox(height: 16),
                ListTile(
                  title: Text(local.logout, style: textTheme.titleMedium),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isDark
                          ? AppColors.darkOutLinePorder
                          : AppColors.lightOutLinePorder,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  tileColor: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  trailing: InkWell(
                    onTap: () {
                      FirebaseServices.logout().then((_) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(LoginScreen.routeName).then((_) {
                          Provider.of<UserProvider>(context).updateUser(null);
                        });
                      });
                    },
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
