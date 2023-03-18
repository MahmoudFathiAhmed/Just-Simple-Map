// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:locations_work/core/routes/functions.dart';
import 'package:locations_work/modules/date_time/cubit/cubit/date_time_cubit.dart';
import 'package:locations_work/modules/date_time/widgets/date_time_line.dart';
import 'package:locations_work/modules/date_time/widgets/hours_button.dart';
import 'package:locations_work/modules/date_time/widgets/minutes_button.dart';

List<DateTime> notAvailable = [
  utcDateTimeFromString('2023-03-14T09:00:00.000Z'),
  utcDateTimeFromString('2023-03-14T10:15:00.000Z'),
  utcDateTimeFromString('2023-03-14T11:00:00.000Z'),
  utcDateTimeFromString('2023-03-14T11:30:00.000Z'),
  utcDateTimeFromString('2023-03-14T12:45:00.000Z'),
  utcDateTimeFromString('2023-03-14T13:00:00.000Z'),
  utcDateTimeFromString('2023-03-14T14:45:00.000Z'),
  utcDateTimeFromString('2023-03-14T15:15:00.000Z'),
  utcDateTimeFromString('2023-03-14T16:00:00.000Z'),
  utcDateTimeFromString('2023-03-14T17:45:00.000Z'),
  utcDateTimeFromString('2023-03-14T18:00:00.000Z'),
  utcDateTimeFromString('2023-03-14T19:30:00.000Z'),
  utcDateTimeFromString('2023-03-14T20:15:00.000Z'),
  utcDateTimeFromString('2023-03-14T21:30:00.000Z'),
  utcDateTimeFromString('2023-03-14T22:00:00.000Z'),
  utcDateTimeFromString('2023-03-15T09:00:00.000Z'),
  utcDateTimeFromString('2023-03-15T12:30:00.000Z'),
];

/*
//todo 
work with dates and utc
work with datetime functions
make functions to compare as a range
// todo
 */
class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  String mySelectedDate = '';
  String mySelectedTime = '';
  List<DateTime> allHours = [];
  List<DateTime> allMinutes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DateTimeCubit, DateTimeState>(
        builder: (context, state) {
          var cubit = DateTimeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // DatePicker(
                //   utcDateTime(DateTime.now()),
                //   initialSelectedDate: utcDateTime(DateTime.now()),
                //   onDateChange: (selectedDate) {
                //     allHours = cubit.buildHoursList(selectedDate);
                //     setState(() {});
                //   },
                // ),
                DateTimeLine(onDateChange: (newDate) {
                  allHours = cubit.buildHoursList(newDate);
                }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: allHours.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2),
                      itemBuilder: (context, index) {
                        return HoursButton(
                            onTap: () {
                              allMinutes =
                                  cubit.buildMinutesList(allHours[index]);
                              Get.bottomSheet(
                                BottomSheet(
                                    enableDrag: false,
                                    onClosing: () {},
                                    builder: (context) {
                                      return Container(
                                        color: Colors.grey.shade100,
                                        height: 240,
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    const Text(
                                                        'select available waiting time'),
                                                    IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.clear)),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                SizedBox(
                                                  height: 40,
                                                  child: ListView.builder(
                                                    itemCount:
                                                        allMinutes.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return MinutesButton(
                                                        hour: cubit
                                                            .getHourFromDate(
                                                                allMinutes[
                                                                    index]),
                                                        buttonColor: cubit
                                                            .changeMinutesButtonColor(
                                                                allMinutes[
                                                                    index]),
                                                        availabilityColor:
                                                            compareSingleDateWithListofDates(
                                                                    notAvailable,
                                                                    allMinutes[
                                                                        index])
                                                                ? Colors.orange
                                                                : Colors.blue,
                                                        onTap: () {
                                                          setState(() {
                                                            cubit
                                                                .changeSelectedButton(
                                                                    allMinutes[
                                                                        index]);
                                                            mySelectedTime = cubit
                                                                .getHourFromDate(
                                                                    allMinutes[
                                                                        index]);
                                                            mySelectedDate = cubit
                                                                .getJustTheDate(
                                                                    allMinutes[
                                                                        index]);
                                                          });
                                                          debugPrint(
                                                              '$mySelectedDate $mySelectedTime');
                                                          //time
                                                          debugPrint(cubit
                                                              .getHourFromDate(
                                                                  allMinutes[
                                                                      index]));
                                                          //date
                                                          debugPrint(cubit
                                                              .getJustTheDate(
                                                                  allMinutes[
                                                                      index]));
                                                          //dateTime as String
                                                          debugPrint(allMinutes[
                                                                  index]
                                                              .toIso8601String());
                                                          //dateTime
                                                          debugPrint(
                                                              '${allMinutes[index]}');
                                                          // cubit.switchButton();
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                const Spacer(),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      'Confirm Time'),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                              ]),
                                        ),
                                      );
                                    }),
                                backgroundColor: Colors.white,
                              );
                            },
                            availabilityColor: compareSingleDateWithListofDates(
                                    notAvailable, allHours[index])
                                ? Colors.orange
                                : Colors.blue,
                            hour: cubit.getHourFromDate(allHours[index]));
                      }),
                ),
                Text('$mySelectedDate $mySelectedTime'),
                const ElevatedButton(
                  child: Text('test'),
                  onPressed: null,
                ),
                const SizedBox(
                  height: 20,
                ),
                // Text('$mySelectedDate, $mySelectedTime'),
              ],
            ),
          );
        },
      ),
    );
  }
}
