import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'vehicle_selection_event.dart';
part 'vehicle_selection_state.dart';

class VehicleSelectionBloc
    extends Bloc<VehicleSelectionEvent, VehicleSelectionState> {
  VehicleSelectionBloc() : super(VehicleSelectionInitial()) {
    on<VehicleSelected>(updateVehicle);
    on<VehicleClearSelectionEvent>(clearSelection);
  }

  FutureOr<void> updateVehicle(
      VehicleSelected event, Emitter<VehicleSelectionState> emit) {
    emit(VehicleSelectionUpdated(event.id));
  }

  FutureOr<void> clearSelection(
      VehicleClearSelectionEvent event, Emitter<VehicleSelectionState> emit) {
    emit(VehicleClearSelectionState());
  }
}
