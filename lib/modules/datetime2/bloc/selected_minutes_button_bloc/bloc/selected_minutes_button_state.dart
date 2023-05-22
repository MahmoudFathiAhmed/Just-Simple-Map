part of 'selected_minutes_button_bloc.dart';

abstract class SelectedMinutesButtonState extends Equatable {
  const SelectedMinutesButtonState();

  @override
  List<Object> get props => [];
}

class SelectedMinutesButtonInitial extends SelectedMinutesButtonState {
  @override
  List<Object> get props => [];
}

class SelectMinutesButtonState extends SelectedMinutesButtonState {
  final DateTime hourWithMinutes;
  const SelectMinutesButtonState(this.hourWithMinutes);
  @override
  List<Object> get props => [hourWithMinutes];
}
