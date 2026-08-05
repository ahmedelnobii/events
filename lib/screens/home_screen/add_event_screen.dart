import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/model/category_model.dart';
import 'package:events/screens/home_screen/taps/home/widgets/tab_item.dart';
import 'package:events/screens/widgets/custom_button.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class AddEventScreen extends StatefulWidget {
  static const routeName = '/AddEventScreen';

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  late Time _time;
  var _dateTime;
  var _dayDate;
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Add event"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.lightInputField,
            foregroundColor: AppColors.lightPrimiary,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: AppColors.lightOutLinePorder),
              borderRadius: BorderRadiusGeometry.circular(8),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .24,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      CategoryModel.categories[currentIndex].image,
                      fit: .contain,
                    ),
                  ),
                ),
              ),
              DefaultTabController(
                length: CategoryModel.categories.length,
                child: TabBar(
                  tabAlignment: .start,
                  labelPadding: EdgeInsets.all(8),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  padding: EdgeInsets.only(top: 16, left: 16, bottom: 16),
                  isScrollable: true,
                  onTap: (value) {
                    currentIndex = value;
                    setState(() {});
                  },
                  tabs: CategoryModel.categories.map((category) {
                    return TabItem(
                      icon: category.icon,
                      label: category.label,
                      isSelected:
                          currentIndex ==
                          CategoryModel.categories.indexOf(category),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: .start,
                      children: [Text('Title', style: textTheme.titleMedium)],
                    ),
                    SizedBox(height: 5),
                    CustomTextFormField(hint: 'Event Title'),
                    SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: .start,
                      children: [
                        Text('Description', style: textTheme.titleMedium),
                      ],
                    ),
                    SizedBox(height: 5),

                    CustomTextFormField(
                      hint: 'Event Description....',
                      maxLines: 5,
                    ),
                    SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.eventDate,
                              height: 24,
                              width: 24,
                              fit: .scaleDown,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).primaryColor,
                                .srcIn,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Event Date'),
                          ],
                        ),
                        InkWell(
                          onTap: () async {
                            _dayDate = await DatePicker.showSimpleDatePicker(
                              context,
                              backgroundColor: Theme.of(context).primaryColor,
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(Duration(days: 365)),
                              looping: false,
                              dateFormat: "dd-MMM-yyyy",
                              pickerMode: DateTimePickerMode.date,
                              textColor: AppColors.lightInputField,
                            );
                            _dayDate = DateFormat(
                              'dd/MM/yyyy',
                            ).format(_dayDate);
                            setState(() {});
                          },
                          child: Text(
                            _dayDate == null ? 'choose date' : "$_dayDate",
                            style: textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: .underline,
                              fontWeight: .w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.eventTime,
                              height: 24,
                              width: 24,
                              fit: .scaleDown,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).primaryColor,
                                .srcIn,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('Event Time'),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            _time = Time(
                              hour: DateTime.now().hour,
                              minute: DateTime.now().minute,
                              second: DateTime.now().second,
                            );
                            Navigator.of(context).push(
                              showPicker(
                                showSecondSelector: false,
                                context: context,
                                value: _time,
                                onChange: onTimeChanged,
                                okStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                cancelStyle: TextStyle(color: AppColors.red),
                                blurredBackground: true,
                                accentColor: Theme.of(context).primaryColor,
                                minuteInterval: TimePickerInterval.FIVE,
                                // Optional onChange to receive value as DateTime
                                onChangeDateTime: (DateTime dateTime) {
                                  // print(dateTime);
                                  //debugPrint("[debug datetime]:  $dateTime");
                                  _dateTime = DateFormat(
                                    'hh:mm a',
                                  ).format(dateTime);
                                  setState(() {});
                                },
                              ),
                            );
                          },
                          child: Text(
                            _dateTime == null ? 'choose time' : '$_dateTime',
                            style: textTheme.titleSmall!.copyWith(
                              color: Theme.of(context).primaryColor,
                              decoration: .underline,
                              fontWeight: .w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(text: 'Add Event', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
