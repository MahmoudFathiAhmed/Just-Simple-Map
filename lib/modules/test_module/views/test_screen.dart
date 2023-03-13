// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:locations_work/modules/date_time/cubit/cubit/date_time_cubit.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DateTimeCubit, DateTimeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                DatePicker(
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  onDateChange: (selectedDate) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .25,
                  child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 16,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 2),
                      itemBuilder: (context, index) {
                        return HourButton(
                          onTap: () {
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
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: HourButton(
                                                      hour: '', onTap: () {}),
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
                          hour: '',
                        );
                      }),
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

class HourButton extends StatelessWidget {
  final Function() onTap;
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
