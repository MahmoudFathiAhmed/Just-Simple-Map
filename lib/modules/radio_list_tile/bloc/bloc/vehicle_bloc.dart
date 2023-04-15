import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc()
      : super(VehicleInitial()) {
    on<VehicleSelected>(updateVehicle);
  }

  FutureOr<void> updateVehicle(
      VehicleSelected event, Emitter<VehicleState> emit) {
    emit(VehicleUpdated(event.id));
  }
}
