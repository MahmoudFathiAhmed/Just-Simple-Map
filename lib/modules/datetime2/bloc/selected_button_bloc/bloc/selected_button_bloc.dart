import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_button_event.dart';
part 'selected_button_state.dart';

class SelectedButtonBloc
    extends Bloc<SelectedButtonEvent, SelectedButtonState> {
  SelectedButtonBloc() : super(SelectedButtonInitial()) {
    on<SelectedButtonChangedEvent>(selectButton);
  }

  FutureOr<void> selectButton(
      SelectedButtonChangedEvent event, Emitter<SelectedButtonState> emit) {
    emit(SelectedButtonUpdatedState(event.date));
  }
}
