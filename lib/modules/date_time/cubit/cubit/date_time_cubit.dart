// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/date_time/models/available_response.dart';

import 'package:locations_work/modules/date_time/repository/date_time_repository.dart';

part 'date_time_state.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeRepository dateTimeRepository;
  DateTimeCubit(
    this.dateTimeRepository,
  ) : super(DateTimeInitial());

  void getAllSubscriptions() {
    dateTimeRepository.getAllSubscriptions().then((result) {
      result.fold((failure) {
        emit(DateTimeError(failure.message));
      }, (response) {
        emit(DateTimeSuccess(response));
      });
    });
  }



  List<DateTime> buildHoursList(DateTime day) {
    DateTime initialDate = day.add(const Duration(hours: 5));
    List<DateTime> dates = [];
    for (int i = 0; i < 15; i++) {
      dates.add(initialDate.add(Duration(hours: i)));
    }
    return dates;
  }


  List<DateTime> buildMinutesList(DateTime hour) {
    List<DateTime> hours = [];
    for (int i = 0; i < 3; i++) {
      hours.add(hour.add(Duration(minutes: i * 15)));
    }
    return hours;
  }

  String getHourFromDate(DateTime date) {
    return date.toIso8601String().substring(11, 16);
  }

  List<DateTime> compareAvailableToAll(List<DateTime> available, List<DateTime> all){
  List<DateTime> availableDates=[];
  for(int i = 0; i<available.length; i++){
    if(all.contains(available[i])){
      availableDates.add(available[i]);
    }
  }
  return availableDates;
}
}
