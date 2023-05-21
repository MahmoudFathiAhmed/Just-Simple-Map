part of 'time_picker_bloc.dart';

abstract class TimePickerState extends Equatable {
  const TimePickerState();

  @override
  List<Object> get props => [];
}

class TimePickerInitial extends TimePickerState {}

class DaySelectedState extends TimePickerState {
  final List<DateTime> hours;

  const DaySelectedState(this.hours);
  @override
  List<Object> get props => [hours];
}

// class HourSelectedState extends TimePickerState {
//   final List<DateTime> hoursWithMinutes;
//   const HourSelectedState(this.hoursWithMinutes);
//   @override
//   List<Object> get props => [hoursWithMinutes];
// }
