import 'package:equatable/equatable.dart';
import 'package:locations_work/modules/radio_list_tile/models/vehicle_response.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();
  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleUpdated extends VehicleState {
  final String selectedVehicleId;

  const VehicleUpdated(this.selectedVehicleId);

  @override
  List<Object> get props => [selectedVehicleId];
}

class GetAllVehilcesSuccessState extends VehicleState {
  final VehicleResponse vehicleResponse;

  const GetAllVehilcesSuccessState(this.vehicleResponse);

  @override
  List<Object> get props => [vehicleResponse];
}

class GetAllVehilcesLoadingState extends VehicleState {}

class GetAllVehilcesErrorState extends VehicleState {
  final String error;

  const GetAllVehilcesErrorState(this.error);
  @override
  List<Object> get props => [error];
}
