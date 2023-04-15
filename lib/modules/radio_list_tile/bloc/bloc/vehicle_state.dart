// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class VehicleState extends Equatable {
  VehicleState();

  List<String> vehiclesIds = ['1', '2', '3'];

  List<String> vehiclesTitles = ['van', 'sedan', '5 pass car'];
  List<int> vehiclesExteriorPrices = [40, 20, 30];
  List<String> vehiclesImages = [
    'https://pics.freeicons.io/uploads/icons/png/10011672171636777626-512.png',
    'https://pics.freeicons.io/uploads/icons/png/11708348221666851072-512.png',
    'https://pics.freeicons.io/uploads/icons/png/17472710041544526147-512.png'
  ];
  List<String> vehiclesdescriptions = ['big car', 'small car', 'small car'];

  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleUpdated extends VehicleState {
  final String selectedVehicleId;

  VehicleUpdated(this.selectedVehicleId);

  @override
  List<Object> get props => [selectedVehicleId];
}
