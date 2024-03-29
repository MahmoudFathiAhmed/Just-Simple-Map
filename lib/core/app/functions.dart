//functions
import 'package:flutter/material.dart';

DateTime utcDateTime(DateTime date) {
  return DateTime.utc(
    date.year,
    date.month,
    date.day,
    date.hour,
    date.minute,
    date.second,
    date.millisecond,
    date.microsecond,
  );
}

List<DateTime> buildHoursList(DateTime day) {
  DateTime initialDate = utcDateTime(day.add(const Duration(hours: 9)));
  List<DateTime> dates = [];
  for (int i = 0; i <= 13; i++) {
    dates.add(utcDateTime(initialDate.add(Duration(hours: i))));
  }
  return dates;
}

DateTime utcDateTimeFromString(String fomatedStringDate) {
  return utcDateTime(DateTime.parse(fomatedStringDate));
}

bool compareSingleDateWithListofDates(
    List<DateTime> allDates, DateTime myDate) {
  return allDates.contains(myDate);
}

String addLeadingZeroToString(String str) {
  if (str.length == 1) {
    return "0$str";
  } else {
    return str;
  }
}

int addLeadingZeroToStringThenInt(String str) {
  if (str.length == 1) {
    return int.parse("0$str");
  } else {
    return int.parse(str);
  }
}

List<DateTime> extractDatesWithDay(List<DateTime> dates, int dayOfWeek) {
  return dates.where((date) => date.day == dayOfWeek).toList();
}

bool isImpossibleToMakeOrder({required DateTime time}) {
  return DateTime.now()
          .toLocal()
          .subtract(const Duration(minutes: 30))
          .compareTo(time.toLocal()) ==
      1;
}
bool isImpossibleToMakeOrder2({required DateTime time}) {
  return time.difference(DateTime.now()).inMinutes<=15;
    // DateTime.now()
    //   .toLocal()
    //   .difference(time).inMinutes<=15;
  // subtract(const Duration(minutes: 30))
  //     .compareTo(time.toLocal()) ==
  //     1;
}

bool isNotAvailable(
    {required List<DateTime> notAvailable, required DateTime date}) {
  return notAvailable.contains(date) || date.isNotToday();
}

Color hourButtonColor(
    {required DateTime myDate, required DateTime selectedDate}) {
  return isImpossibleToMakeOrder(time: myDate)
      ? Colors.grey.shade300
      : selectedDate.toExactHour() == myDate
          ? Colors.blue
          : Colors.white;
}

Color hourAvailableColor({required DateTime myDate, required List<DateTime> notAvailable}){
  return isImpossibleToMakeOrder(
      time:myDate)
      ? Colors.grey.shade300
      : isNotAvailable(
      notAvailable:
      notAvailable,
      date:
      myDate)
      ? Colors.orange
      : Colors.blue;
}

extension NotINListOFDateExtension on List<DateTime> {
  List<DateTime> notIn(List<DateTime> other) {
    return where((element) => !other.contains(element)).toList();
  }
}
extension AnyAfterNowBy on List<DateTime> {
  bool anyAfterNowBy(int minutes) {
    return any((element) => element.difference(DateTime.now()).inMinutes > minutes);
  }
}
///very important
Color hourAvailableColor3({required DateTime myDate, required List<DateTime> notAvailable,required List<DateTime> minutesList}){
  List<DateTime> restMinutesList = minutesList.where((element) => element.difference(DateTime.now()).inMinutes > 15).toList();
  if(isImpossibleToMakeOrder(time: myDate)){
    return Colors.grey.shade300;
  }else if(minutesList.notIn(notAvailable).isEmpty){
    return Colors.blue;
  }else if(restMinutesList.every((element) => notAvailable.contains(element))){
    return Colors.orange;
  }else{
    return Colors.blue;
  }

  // return isImpossibleToMakeOrder(
  //     time:myDate)
  //     ? Colors.grey.shade300
  //     : isNotAvailable(
  //     notAvailable:
  //     notAvailable,
  //     date:
  //     myDate)
  //     ? Colors.orange
  //     : Colors.blue;
}
Color minutesAvailableColor({required DateTime myDate, required List<DateTime> notAvailable}){
  return isNotAvailable(notAvailable: notAvailable, date: myDate) ? Colors.orange : Colors.blue;
}

// if there is a member of list exist in another list
bool containsDateTime(List<DateTime> list1, List<DateTime> list2) {
  return list1.toSet().intersection(list2.toSet()).isNotEmpty;
}

DateTime getFirstMoriningHourOfToday() {
  DateTime now = DateTime.now().toLocal();
  return DateTime(now.year, now.month, now.day).toLocal();
}

DateTime getFirstMoriningHourOfAnyDay(DateTime day) {
  return DateTime(day.year, day.month, day.day).toLocal();
}

List<DateTime> getWorkSpecificHours(DateTime time) {
  List<DateTime> dates = [];
  for (int i = 0; i <= 13; i++) {
    dates.add(time.add(Duration(hours: i)));
  }
  return dates;
}

List<DateTime> getFifteenMinutesIntervals(DateTime specificHour) {
  List<DateTime> intervals = [specificHour];
  for (int i = 1; i < 4; i++) {
    intervals.add(specificHour.add(Duration(minutes: 15 * i)));
  }
  return intervals;
}

//extensions
extension DateTimeIntervals on DateTime {
  List<DateTime> getFifteenMinutesIntervals() {
    List<DateTime> intervals = [this];
    for (int i = 1; i < 4; i++) {
      intervals.add(add(Duration(minutes: 15 * i)));
    }
    return intervals;
  }
}

extension DateTimeWorkHours on DateTime {
  List<DateTime> getWorkHours() {
    List<DateTime> dates = [];
    for (int i = 0; i <= 13; i++) {
      dates.add(add(Duration(hours: i + 9)));
    }
    return dates;
  }
}

extension DateTimeExtensions on DateTime {
  DateTime getFirstMorningHour() {
    return DateTime(year, month, day).toLocal();
  }
}

extension ContainsDateTime on List<DateTime> {
  bool containsAny(List<DateTime> other) {
    return toSet().intersection(other.toSet()).isNotEmpty;
  }
}

extension StringExtension on String {
  String addLeadingZero() {
    if (length == 1) {
      return "0$this";
    } else {
      return this;
    }
  }
}

extension StringExtensionV2 on String {
  int addLeadingZeroAndConvertToInt() {
    if (length == 1) {
      return int.parse("0$this");
    } else {
      return int.parse(this);
    }
  }
}

//important used
extension IntExtension on int {
  String addLeadingZero() {
    if (this < 10) {
      return "0$this";
    } else {
      return toString();
    }
  }
}

//important used
extension DateTimeListExtensions on List<DateTime> {
  List<DateTime> extractDatesWithDay(int selectedDay) {
    return where((date) => date.day == selectedDay).toList();
  }
}

//exact hours
extension DateTimeExactHour on DateTime {
  DateTime toExactHour() {
    return DateTime(year, month, day, hour);
  }
}

extension DateTimeIsNotToday on DateTime {
  bool isNotToday() {
    return year != DateTime.now().year ||
        month != DateTime.now().month ||
        day != DateTime.now().day;
  }
}
extension ResponsiveText on Text {
  Widget responsive() {
    return Expanded(
      child: Text(
        data!,
      ),
    );
  }
}
