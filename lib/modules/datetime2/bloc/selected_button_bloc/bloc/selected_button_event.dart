part of 'selected_button_bloc.dart';

abstract class SelectedButtonEvent extends Equatable {
  const SelectedButtonEvent();

  @override
  List<Object> get props => [];
}

class SelectedButtonChangedEvent extends SelectedButtonEvent {
  // final int index;
  final DateTime date;
  // const SelectedButtonChangedEvent(this.index);
  const SelectedButtonChangedEvent(this.date);
  @override
  List<Object> get props => [date];
  // List<Object> get props => [index];
}
// class ResetSelectedButtonEvent extends SelectedButtonEvent{}
