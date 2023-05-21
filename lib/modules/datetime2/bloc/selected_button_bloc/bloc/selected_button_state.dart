part of 'selected_button_bloc.dart';

abstract class SelectedButtonState extends Equatable {
  const SelectedButtonState();

  @override
  List<Object> get props => [];
}

class SelectedButtonInitial extends SelectedButtonState {}

class SelectedButtonUpdatedState extends SelectedButtonState {
  final DateTime date;
  // final int index;

  const SelectedButtonUpdatedState(this.date);

  @override
  List<Object> get props => [date];
}
// class ResetSelectedButtonState extends SelectedButtonState {}
