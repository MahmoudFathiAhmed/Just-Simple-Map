part of 'selected_minutes_button_bloc.dart';

abstract class SelectedMinutesButtonEvent extends Equatable {
  const SelectedMinutesButtonEvent();

  @override
  List<Object> get props => [];
}

class SelectMinutesButtonEvent extends SelectedMinutesButtonEvent {
  final DateTime hour;
  const SelectMinutesButtonEvent(this.hour);
  @override
  List<Object> get props => [hour];
}
