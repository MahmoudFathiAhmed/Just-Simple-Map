import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_button_event.dart';
part 'selected_button_state.dart';

class SelectedButtonBloc
    extends Bloc<SelectedButtonEvent, SelectedButtonState> {
  SelectedButtonBloc() : super(SelectedButtonInitial()) {
    on<SelectedButtonChangedEvent>(selectButton);
    // on<ResetSelectedButtonEvent>(resetButton);
  }

  FutureOr<void> selectButton(
      SelectedButtonChangedEvent event, Emitter<SelectedButtonState> emit) {
    emit(SelectedButtonUpdatedState(event.index));
  }

  // FutureOr<void> resetButton(
  //     ResetSelectedButtonEvent event, Emitter<SelectedButtonState> emit) {
  //   emit(SelectedButtonInitial());
  // }
}
