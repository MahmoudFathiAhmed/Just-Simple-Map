import 'package:equatable/equatable.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

class VehicleSelected extends VehicleEvent {
  final String id;

  const VehicleSelected(this.id);

  @override
  List<Object> get props => [id];
}

class GetAllVehiclesEvent extends VehicleEvent{}