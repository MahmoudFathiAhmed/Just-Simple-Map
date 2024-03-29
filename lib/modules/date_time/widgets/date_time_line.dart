// import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timetable/date_picker_timetable.dart';
import 'package:flutter/material.dart';
import 'package:locations_work/core/app/functions.dart';

class DateTimeLine extends StatelessWidget {
  final Function(DateTime) onDateChange;
  const DateTimeLine({super.key, required this.onDateChange});

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      utcDateTime(DateTime.now()),
      initialSelectedDate: utcDateTime(DateTime.now()),
      onDateChange: onDateChange,
    );
  }
}
