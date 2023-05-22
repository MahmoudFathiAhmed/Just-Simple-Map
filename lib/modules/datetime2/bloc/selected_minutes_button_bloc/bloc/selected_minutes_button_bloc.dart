import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_minutes_button_event.dart';
part 'selected_minutes_button_state.dart';

class SelectedMinutesButtonBloc
    extends Bloc<SelectedMinutesButtonEvent, SelectedMinutesButtonState> {
  SelectedMinutesButtonBloc() : super(SelectedMinutesButtonInitial()) {
    on<SelectMinutesButtonEvent>(_selectHourWithMinutesButton);
  }

  FutureOr<void> _selectHourWithMinutesButton(SelectMinutesButtonEvent event,
      Emitter<SelectedMinutesButtonState> emit) {
    emit(SelectMinutesButtonState(event.hour));
  }
}
