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
class ChangeDayLoadingState extends DateTimeState {
  @override
  List<Object> get props => [];
}
class ChangeMinutesLoadingState extends DateTimeState {
  @override
  List<Object> get props => [];
}

class ChangeMinutesState extends DateTimeState {
  @override
  List<Object> get props => [];
}

class SwitchState extends DateTimeState {
  @override
  List<Object> get props => [];
}

class ChangeMinutesButtonColorstate extends DateTimeState {
  @override
  List<Object> get props => [];
}
class ChangeSelectedButtonstate extends DateTimeState {
  @override
  List<Object> get props => [];
}
