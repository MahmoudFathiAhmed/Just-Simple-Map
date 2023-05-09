import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/radio_list_tile/repository/vehicle_repository.dart';
import 'vehicle_event.dart';
import 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository vehicleRepository;
  VehicleBloc(this.vehicleRepository) : super(VehicleInitial()) {

    on<GetAllVehiclesEvent>(getallEventsVehicles);
  }



  FutureOr<void> getallEventsVehicles(
      GetAllVehiclesEvent event, Emitter<VehicleState> emit) async {
    emit(GetAllVehilcesLoadingState());
    await vehicleRepository
        .getAllVehicle()
        .then((result) => result.fold((error) {
              emit(GetAllVehilcesErrorState(error.message));
            }, (response) async {
              emit(GetAllVehilcesSuccessState(response));
            }));
  }
}
