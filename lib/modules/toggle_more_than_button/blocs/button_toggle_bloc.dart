import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/toggle_more_than_button/blocs/button_toggle_event.dart';

class ButtonToggleBloc extends Bloc<ButtonToggleEvent, ButtonIndex?> {
  ButtonToggleBloc() : super(null) {//this line if the initial state is no buttons selected
  // ButtonToggleBloc() : super(ButtonIndex.button1) {//if you want to make specific button selected by default
    on<ButtonToggleEvent>(toggle);
  }

  void toggle(ButtonToggleEvent event, Emitter<ButtonIndex?> emit) {
    emit(event.index);
  }
}
