part of 'selected_button_bloc.dart';

abstract class SelectedButtonEvent extends Equatable {
  const SelectedButtonEvent();

  @override
  List<Object> get props => [];
}
class SelectedButtonChangedEvent extends SelectedButtonEvent{
  final int index;

  const SelectedButtonChangedEvent(this.index);
  @override
  List<Object> get props => [index];
}
// class ResetSelectedButtonEvent extends SelectedButtonEvent{}
