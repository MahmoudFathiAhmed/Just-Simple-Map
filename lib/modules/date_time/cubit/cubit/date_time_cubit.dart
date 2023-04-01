// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/routes/functions.dart';
import 'package:locations_work/modules/date_time/models/available_response.dart';


part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  // DateTimeRepository dateTimeRepository;
  DateTimeCubit(
      // this.dateTimeRepository,
      )
      : super(DateTimeInitial());
  static DateTimeCubit get(context) => BlocProvider.of(context);

  // void getAllSubscriptions() {
  //   dateTimeRepository.getAllSubscriptions().then((result) {
  //     result.fold((failure) {
  //       emit(DateTimeError(failure.message));
  //     }, (response) {
  //       emit(DateTimeSuccess(response));
  //     });
  //   });
  // }
  DateTime twoDaysBefore =
      utcDateTime(DateTime.now().subtract(const Duration(days: 2)));
  DateTime selected = utcDateTime(DateTime.now());

  List<DateTime> buildHoursList(DateTime day) {
    emit(ChangeDayLoadingState());
    DateTime initialDate = utcDateTime(day.add(const Duration(hours: 9)));
    List<DateTime> dates = [];
    for (int i = 0; i <= 13; i++) {
      dates.add(utcDateTime(initialDate.add(Duration(hours: i))));
    }
    emit(ChangeDayState());
    return dates;
  }

  List<DateTime> buildMinutesList(DateTime hour) {
    emit(ChangeMinutesLoadingState());
    List<DateTime> hours = [];
    for (int i = 0; i <= 3; i++) {
      hours.add(utcDateTime(hour.add(Duration(minutes: i * 15))));
    }
    emit(ChangeMinutesState());
    return hours;
  }

  String getHourFromDate(DateTime date) {
    return date.toIso8601String().substring(11, 16);
  }

  String getJustTheDate(DateTime date) {
    return utcDateTime(date).toIso8601String().substring(0, 10);
  }

  DateTime getDateFromString(String date) {
    return utcDateTime(DateTime.parse(date));
  }

  List<DateTime> compareAvailableToAll(
      List<DateTime> available, List<DateTime> all) {
    List<DateTime> availableDates = [];
    for (int i = 0; i < available.length; i++) {
      if (all.contains(utcDateTime(available[i]))) {
        availableDates.add(utcDateTime(available[i]));
      }
    }
    return availableDates;
  }

  bool compareSingleDateWithListofDates(
      List<DateTime> allDates, DateTime myDate) {
    return allDates.contains(myDate);
  }

  Color changeMinutesButtonColor(DateTime date) {
    emit(ChangeMinutesButtonColorstate());
    return selected == utcDateTime(date) ? Colors.blue : Colors.white;
  }

  void changeSelectedButton(DateTime date) {
    selected = utcDateTime(date);
    emit(ChangeSelectedButtonstate());
  }

 void Function(DateTime)?onChanged(DateTime selecteDate){
   return null;
 
 }
}
