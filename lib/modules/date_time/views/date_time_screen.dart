// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

  List<String> time = [
    '05:00 Am',
    '06:00 Am',
    '07:00 Am',
    '08:00 Am',
    '09:00 Am',
    '10:00 Am',
    '11:00 Am',
    '12:00 Pm',
    '01:00 Pm',
    '02:00 Pm',
    '03:00 Pm',
    '04:00 Pm',
    '05:00 Pm',
    '06:00 Pm',
    '07:00 Pm',
    '08:00 Pm',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            DatePicker(
              DateTime.now(),
              controller: controller,
              initialSelectedDate: DateTime.now(),
              onDateChange: (selectedDate) {
                mySelectedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                debugPrint(selectedDate.toIso8601String());
              },
            ),
            
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .25,
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: time.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2),
                  itemBuilder: (context, index) {
                    return HourButton(
                      onTap: () {
                        mySelectedTime = time[index];
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: HourButton(
                                                  color: selectedButton.any(
                                                          (element) =>
                                                              element == index)
                                                      ? Colors.blue
                                                      : Colors.white,
                                                  onTap: () {
                                                    selectButton(index);
                                                    mySelectedTime =
                                                        mySelectedTime.replaceAll(
                                                            '00',
                                                            index * 15 == 0
                                                                ? '00'
                                                                : '${index * 15}');
                                                    setState(() {});
                                                    // Navigator.pop(context);
                                                  },
                                                  hour: mySelectedTime.replaceAll(
                                                      '00',
                                                      index * 15 == 0
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
                      hour: time[index],
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Text('$mySelectedDate, $mySelectedTime'),
          ],
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
