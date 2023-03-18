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
