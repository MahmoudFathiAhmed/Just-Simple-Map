part of 'selected_button_bloc.dart';

abstract class SelectedButtonState extends Equatable {
  const SelectedButtonState();
  
  @override
  List<Object> get props => [];
}

class SelectedButtonInitial extends SelectedButtonState {}

class SelectedButtonUpdatedState extends SelectedButtonState {
  final int index;

  const SelectedButtonUpdatedState(this.index);

  @override
  List<Object> get props => [index];
}
// class ResetSelectedButtonState extends SelectedButtonState {}
