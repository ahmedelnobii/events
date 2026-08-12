import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:events/core/constants/app_icons.dart';
import 'package:events/core/theme/app_colors.dart';
import 'package:events/model/category_model.dart';
import 'package:events/model/event_model.dart';
import 'package:events/providers/event_provider.dart';
import 'package:events/screens/home_screen/taps/home/widgets/tab_item.dart';
import 'package:events/screens/widgets/custom_button.dart';
import 'package:events/screens/widgets/custom_text_form_fieled.dart';
import 'package:events/screens/widgets/firebase_servises.dart';
import 'package:events/screens/widgets/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatefulWidget {
  static const routeName = '/EditScreen';

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late EventModel event;
  late Time _time;
  late var _dateTime = DateFormat('hh:mm a').format(event.dateTime);
  late var _dayDate = DateFormat('MMM dd,yyyy').format(event.dateTime);
  late DateTime? dateTime = event.dateTime;
  late DateTime? dayDate = event.dateTime;
  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late int currentIndex = CategoryModel.categories.indexWhere(
    (category) => category == event.categoryModel,
  );

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleController.text = event.title;
      descriptionController.text = event.description;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    event = ModalRoute.of(context)?.settings.arguments as EventModel;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit event"),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.lightInputField,
            foregroundColor: Theme.of(context).primaryColor,
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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: .start,
                        children: [Text('Title', style: textTheme.titleMedium)],
                      ),
                      SizedBox(height: 5),
                      CustomTextFormField(
                        hint: 'Event Title',
                        controller: titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'title can not be empty';
                          }
                          return null;
                        },
                      ),
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
                        controller: descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description can not be empty';
                          }
                          return null;
                        },
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
                              dayDate = await DatePicker.showSimpleDatePicker(
                                context,
                                backgroundColor: Theme.of(context).primaryColor,
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  Duration(days: 365),
                                ),
                                looping: false,
                                dateFormat: "dd-MMM-yyyy",
                                pickerMode: DateTimePickerMode.date,
                                textColor: AppColors.lightInputField,
                              );
                              _dayDate = DateFormat(
                                'dd/MM/yyyy',
                              ).format(dayDate!);
                              setState(() {});
                            },
                            child: Text(
                              _dayDate = "$_dayDate",
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
                                    this.dateTime = dateTime;
                                    _dateTime = DateFormat(
                                      'hh:mm a',
                                    ).format(dateTime);
                                    setState(() {});
                                  },
                                ),
                              );
                            },
                            child: Text(
                              _dateTime,
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
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomButton(
                  text: 'Update Event',
                  onPressed: onUpdateEvent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onUpdateEvent() {
    if (formKey.currentState!.validate() &&
        this.dateTime != null &&
        dayDate != null) {
      DateTime myDateTime = DateTime(
        dayDate!.year,
        dayDate!.month,
        dayDate!.day,
        this.dateTime!.hour,
        this.dateTime!.minute,
      );
      EventModel updatedEvent = EventModel(
        id: event.id,
        categoryModel: CategoryModel.categories[currentIndex],
        description: descriptionController.text,
        title: titleController.text,
        dateTime: myDateTime,
      );
      FirebaseServices.updateEvent(updatedEvent)
          .then((_) {
            Navigator.of(context).pop();
            UiUtils.showSuccsesMessage('event updated successfully');
            Provider.of<EventProvider>(context, listen: false).getEvents();
          })
          .catchError((_) {
            UiUtils.showFailedMessage('Failed to updated event');
          });
    }
  }
}
