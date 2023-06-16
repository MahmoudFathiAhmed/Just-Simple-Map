import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locations_work/core/routes/functions.dart';

part 'time_picker_event.dart';
part 'time_picker_state.dart';

class TimePickerBloc extends Bloc<TimePickerEvent, DaySelectedState> {
// class TimePickerBloc extends Bloc<TimePickerEvent, TimePickerState> {
  TimePickerBloc()
      : super(DaySelectedState(getFirstMoriningHourOfToday().getWorkHours())) {
      // : super(DaySelectedState(getFirstMoriningHourOfToday().getWorkHours())) {
    on<DaySelectedEvent>(selectDay);
    // on<HourSelectedEvent>(selectHour);
  }

  FutureOr<void> selectDay(
      DaySelectedEvent event, Emitter<DaySelectedState> emit) {
    debugPrint('*****${event.day}');
    emit(DaySelectedState(event.day.getWorkHours()));
  }

  // FutureOr<void> selectHour(
  //     HourSelectedEvent event, Emitter<TimePickerState> emit) {
  //   emit(HourSelectedState(event.hour.getFifteenMinutesIntervals()));
  // }
}
