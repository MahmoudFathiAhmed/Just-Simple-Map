import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locations_work/core/routes/functions.dart';

part 'time_picker_event.dart';
part 'time_picker_state.dart';

class TimePickerBloc extends Bloc<TimePickerEvent, TimePickerState> {
  TimePickerBloc()
      : super(DaySelectedState(getFirstMoriningHourOfToday().getWorkHours())) {
    // TimePickerBloc() : super(TimePickerInitial()) {
    on<DaySelectedEvent>(selectDay);
    on<HourSelectedEvent>(selectHour);
  
    // on<HourWithMinutesSelectedEvent>(selectHourWithMinutes);
  }

  FutureOr<void> selectDay(
      DaySelectedEvent event, Emitter<TimePickerState> emit) {
    emit(DaySelectedState(event.day.getWorkHours()));
  }

  FutureOr<void> selectHour(
      HourSelectedEvent event, Emitter<TimePickerState> emit) {
    emit(HourSelectedState(event.hour.getFifteenMinutesIntervals()));
    // add(DaySelectedEvent(
    //     event.hour.getFirstMorningHour()));
  }

  // FutureOr<void> selectHourWithMinutes(
  //     HourWithMinutesSelectedEvent event, Emitter<TimePickerState> emit) {
  //   emit(HourWithMinutesSelectedState(event.hourWithMinutes));
  //   // add(DaySelectedEvent(
  //   //     event.hourWithMinutes.getFirstMorningHour()));
  // }

}
