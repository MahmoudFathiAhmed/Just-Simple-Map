part of 'time_picker_bloc.dart';

abstract class TimePickerEvent extends Equatable {
  const TimePickerEvent();

  @override
  List<Object> get props => [];
}

class DaySelectedEvent extends TimePickerEvent {
  final DateTime day;

  const DaySelectedEvent(this.day);
  @override
  List<Object> get props => [day];
}

class HourSelectedEvent extends TimePickerEvent {
  final DateTime hour;

  const HourSelectedEvent(this.hour);
  @override
  List<Object> get props => [hour];
}

// class HourWithMinutesSelectedEvent extends TimePickerEvent {
//   final DateTime hourWithMinutes;

//   const HourWithMinutesSelectedEvent(this.hourWithMinutes);
//   @override
//   List<Object> get props => [hourWithMinutes];
// }
