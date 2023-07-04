import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/just_example/bloc/just_toggle_event.dart';

class JustToggleBloc extends Bloc<JustToggleEvent, JustButtonIndex> {
  JustToggleBloc() : super(JustButtonIndex.justButton1) {
    on<JustToggleEvent>(toggle);
  }

  void toggle(JustToggleEvent event, Emitter<JustButtonIndex> emit) {
    emit(event.index);
  }
}