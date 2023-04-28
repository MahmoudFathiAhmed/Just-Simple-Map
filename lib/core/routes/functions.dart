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
// if there is a member of list exist in another list
bool containsDateTime(List<DateTime> list1, List<DateTime> list2) {
  return list1.toSet().intersection(list2.toSet()).isNotEmpty;
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
