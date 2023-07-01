import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/toggle_more_than_button/blocs/button_toggle_event.dart';

class ButtonToggleBloc extends Bloc<ButtonToggleEvent, ButtonIndex> {
  ButtonToggleBloc() : super(ButtonIndex.button1) {
    on<ButtonToggleEvent>(toggle);
  }

  FutureOr<void> toggle(ButtonToggleEvent event, Emitter<ButtonIndex> emit) {
    emit(event.index);
  }
}
