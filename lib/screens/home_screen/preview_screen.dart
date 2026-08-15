import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/core/theme/app_theme.dart';
import 'package:events/model/event_model.dart';
import 'package:events/providers/event_provider.dart';
import 'package:events/providers/theme_provider.dart';
import 'package:events/screens/home_screen/edit_screen.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:events/screens/widgets/ui_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PreviewScreen extends StatelessWidget {
  static const routeName = '/PreviewScreen';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var event = ModalRoute.of(context)!.settings.arguments as EventModel;
    var theme = Theme.of(context);
    bool isDark = Provider.of<ThemeProvider>(context).isDark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            backgroundColor: isDark
                ? AppColors.darkInputField
                : AppColors.lightInputField,
            foregroundColor: isDark
                ? AppColors.darkMainText
                : theme.primaryColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: isDark
                    ? AppColors.darkOutLinePorder
                    : AppColors.lightOutLinePorder,
              ),
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
        title: Text('Event Details', style: theme.textTheme.titleLarge),
        actions: [
          Visibility(
            child: InkWell(
              onTap: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(EditScreen.routeName, arguments: event);
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkOutLinePorder
                        : AppColors.lightOutLinePorder,
                  ),
                ),
                child: SvgPicture.asset(
                  AppIcons.edit,
                  height: 24,
                  width: 24,
                  fit: .scaleDown,
                  colorFilter: ColorFilter.mode(theme.primaryColor, .srcIn),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Visibility(
            child: InkWell(
              onTap: () {
                FirebaseServices.deleteEvent(event.id)
                    .then((_) {
                      Navigator.of(context).pop();
                      Provider.of<EventProvider>(
                        context,
                        listen: false,
                      ).getEvents();

                      UiUtils.showSuccsesMessage('event deleted successfuly');
                    })
                    .catchError((_) {
                      UiUtils.showFailedMessage('SomeThing went wrong');
                    });
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkOutLinePorder
                        : AppColors.lightOutLinePorder,
                  ),
                ),
                child: SvgPicture.asset(
                  AppIcons.delete,
                  height: 24,
                  width: 24,
                  fit: .scaleDown,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: .start,
            children: [
              Container(
                clipBehavior: .antiAlias,
                height: screenSize.height * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkOutLinePorder
                        : AppColors.lightOutLinePorder,
                    style: .solid,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Image.asset(
                    isDark
                        ? event.categoryModel.darkImage
                        : event.categoryModel.image,
                    fit: .cover,
                    isAntiAlias: true,
                  ),
                ),
              ),
              Text(event.title, style: theme.textTheme.titleLarge),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkOutLinePorder
                        : AppColors.lightOutLinePorder,
                  ),
                ),
                child: Row(
                  spacing: 16,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.transparent
                            : AppColors.lightBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: isDark
                              ? AppColors.darkOutLinePorder
                              : AppColors.lightOutLinePorder,
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppIcons.eventDate,
                        height: 39,
                        width: 39,
                        fit: .scaleDown,
                        colorFilter: ColorFilter.mode(
                          theme.primaryColor,
                          .srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            DateFormat('dd MMMM').format(event.dateTime),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: .w500,
                            ),
                          ),

                          Text(
                            DateFormat('hh:mm a').format(event.dateTime),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: .w500,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Description',
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: .w500),
              ),
              Container(
                height: screenSize.height * .33,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.darkInputField
                      : AppColors.lightInputField,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isDark
                        ? AppColors.darkOutLinePorder
                        : AppColors.lightOutLinePorder,
                  ),
                ),
                child: Text(
                  event.description,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: isDark
                        ? AppColors.darkMainText
                        : AppColors.lightMainText,
                    fontWeight: .w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
