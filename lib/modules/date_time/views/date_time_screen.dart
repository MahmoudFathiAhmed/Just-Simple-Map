// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timetable/date_picker_timetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/routes/functions.dart';
import 'package:locations_work/modules/date_time/cubit/cubit/date_time_cubit.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  DatePickerController controller = DatePickerController();
  String mySelectedDate = '';
  String mySelectedTime = '';
  List<int> selectedButton = [];
  List<String> allHoursList = [];
  List<DateTime> dayHourList = [];
  List<DateTime> dayHoursList = [];
  bool isButtonSelected = false;
  void selectButton(int id) {
    if (selectedButton.contains(id)) {
      selectedButton.remove(id);
      setState(() {});
    } else {
      selectedButton.add(id);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
                  DateTimeCubit(getIt.get())..getAvailabilityStatus())
        ],
        child: BlocBuilder<DateTimeCubit, DateTimeState>(
          builder: (context, dateTimeState) {
            if (dateTimeState is AvailablilityStatusLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (dateTimeState is AvailablilityStatusSuccess) {
              for (var item
                  in dateTimeState.availableAndNotAvailableResponse.result!) {
                String day = item.day!.addLeadingZero();
                String hour = item.hour!.addLeadingZero();
                String dayHour =
                    '${DateTime.now().year}-${DateTime.now().month.addLeadingZero()}-$day $hour:00:00.000Z';
                DateTime dayHourDateTime = DateTime.parse(dayHour).toLocal();
                dayHourList.add(dayHourDateTime);
                allHoursList.add(hour);
              }
              debugPrint('$dayHourList');
              debugPrint('$allHoursList');

              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    DatePicker(
                      DateTime.now().toLocal(),
                      controller: controller,
                      initialSelectedDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        debugPrint(
                            'selected Date: ${selectedDate.day},day Hour List First: ${dayHourList.first.day}');
                        debugPrint(
                            '${dayHourList.extractDatesWithDay(selectedDate.day)}');
                        dayHoursList =
                            dayHourList.extractDatesWithDay(selectedDate.day);
                        mySelectedDate =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                        debugPrint(selectedDate.toIso8601String());
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .25,
                      child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: dayHoursList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2),
                          itemBuilder: (context, index) {
                            return HourButton(
                              onTap: () {
                                mySelectedTime = dayHoursList[index].toString();
                                Get.bottomSheet(
                                  StatefulBuilder(
                                    builder: (context, setState) {
                                      return SizedBox(
                                        height: Get.height * .3,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 42,
                                              child: ListView.builder(
                                                  itemCount: 4,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: HourButton(
                                                          color: selectedButton
                                                                  .any((element) =>
                                                                      element ==
                                                                      index)
                                                              ? Colors.blue
                                                              : Colors.white,
                                                          onTap: () {
                                                            selectButton(index);
                                                            mySelectedTime =
                                                                mySelectedTime.replaceAll(
                                                                    '00',
                                                                    index * 15 ==
                                                                            0
                                                                        ? '00'
                                                                        : '${index * 15}');
                                                            setState(() {});
                                                            // Navigator.pop(context);
                                                          },
                                                          hour: mySelectedTime
                                                              .replaceAll(
                                                                  '00',
                                                                  index * 15 ==
                                                                          0
                                                                      ? '00'
                                                                      : '${index * 15}')),
                                                    );
                                                  }),
                                            ),
                                            ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Choose Time'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  backgroundColor: Colors.white,
                                );
                                // setState(() {
                                //   mySelectedTime = time[index];
                                // });
                              },
                              hour: dayHoursList[index]
                                  .toString()
                                  .substring(11, 16),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('$mySelectedDate, $mySelectedTime'),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('error'),
              );
            }
          },
        ),
      ),
    );
  }
}

class HourButton extends StatelessWidget {
  final Function()? onTap;
  final String hour;
  final Color color;

  const HourButton({
    Key? key,
    required this.onTap,
    required this.hour,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * .2,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, blurRadius: 10),
            ]),
        child: Center(child: Text(hour)),
      ),
    );
  }
}
