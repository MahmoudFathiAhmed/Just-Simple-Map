import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locations_work/modules/date_time/views/date_time_screen.dart';
import 'package:locations_work/modules/date_time/widgets/minutes_button.dart';
import 'package:locations_work/modules/update_order/functions/functions.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class SelectDateUpdateOrderScreen extends StatefulWidget {
  const SelectDateUpdateOrderScreen({super.key});

  @override
  State<SelectDateUpdateOrderScreen> createState() =>
      _SelectDateUpdateOrderScreenState();
}

class _SelectDateUpdateOrderScreenState
    extends State<SelectDateUpdateOrderScreen> {
  late DateTime now;
  late DateTime lastMidnight;
  late DateTime initialDate;
  List<DateTime> allHours = [];
  List<DateTime> allMinutes = [];

  @override
  void initState() {
    super.initState();
    now = utcDateTime(DateTime.now());
    lastMidnight = utcDateTime(DateTime(now.year, now.month, now.day));
    initialDate = lastMidnight.add(const Duration(hours: 9));
    List<DateTime> dates = [];
    for (int i = 0; i <= 13; i++) {
      dates.add(utcDateTime(initialDate.add(Duration(hours: i))));
    }
    allHours = dates;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DatePicker(
                  now,
                  height: 90,
                  width: 75,
                  initialSelectedDate: now,
                  selectionColor: Colors.blue,
                  selectedTextColor: Colors.white,
                  deactivatedColor: Colors.grey.shade200,
                  daysCount: 4,
                  inactiveDates: [
                    utcDateTime(DateTime.now().add(const Duration(days: 3)))
                  ],
                  onDateChange: (date) {
                    allHours = buildHoursList(utcDateTime(date));
                  },
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'Select Time',
              ),
              const SizedBox(height: 12),
              SizedBox(
                  height: 220,
                  child: GridView.builder(
                    itemCount: allHours.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      return HourButton(
                        hour: getHourFromDate(
                          allHours[index],
                        ),
                        onTap:
                            now
                                        .subtract(const Duration(minutes: 30))
                                        .compareTo(allHours[index]) ==
                                    1
                                ? null
                                : () {
                                    allMinutes =
                                        buildMinutesList(allHours[index]);
                                    Get.bottomSheet(
                                      BottomSheet(
                                        onClosing: () {},
                                        enableDrag: false,
                                        backgroundColor: Colors.white,
                                        builder: (context) {
                                          return Container(
                                            color: Colors.grey.withOpacity(.1),
                                            height: 240,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
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
                                                            buttonColor:
                                                                Colors.white,
                                                            availabilityColor:
                                                                Colors.blue,
                                                            hour: getHourFromDate(
                                                                utcDateTime(
                                                                    allMinutes[
                                                                        index])),
                                                            onTap: (now.compareTo(allMinutes[
                                                                            index]) ==
                                                                        1 ||
                                                                    now.add(const Duration(minutes: 15)).compareTo(
                                                                            allMinutes[index]) ==
                                                                        1)
                                                                ? null
                                                                : () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ]),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
