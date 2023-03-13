part of 'date_time_cubit.dart';

abstract class DateTimeState extends Equatable {
  const DateTimeState();

  @override
  List<Object> get props => [];
}

class DateTimeInitial extends DateTimeState {}

class DateTimeSuccess extends DateTimeState {
  final AvailableResponse availableResponse;

  const DateTimeSuccess(this.availableResponse);

  @override
  List<Object> get props => [availableResponse];
}

class DateTimeError extends DateTimeState {
  final String error;

  const DateTimeError(this.error);

  @override
  List<Object> get props => [error];
}
class ChangeDayState extends DateTimeState{
  
}
