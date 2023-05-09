part of 'vehicle_selection_bloc.dart';

abstract class VehicleSelectionState extends Equatable {
  const VehicleSelectionState();
  
  @override
  List<Object> get props => [];
}

class VehicleSelectionInitial extends VehicleSelectionState {}

class VehicleSelectionUpdated extends VehicleSelectionState {
  final String selectedVehicleId;

  const VehicleSelectionUpdated(this.selectedVehicleId);

  @override
  List<Object> get props => [selectedVehicleId];
}

class VehicleClearSelectionState extends VehicleSelectionState{
@override
  List<Object> get props => [];
}
