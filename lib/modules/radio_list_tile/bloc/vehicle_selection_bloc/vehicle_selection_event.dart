part of 'vehicle_selection_bloc.dart';

abstract class VehicleSelectionEvent extends Equatable {
  const VehicleSelectionEvent();

  @override
  List<Object> get props => [];
}
class VehicleSelected extends VehicleSelectionEvent {
  final String id;

  const VehicleSelected(this.id);

  @override
  List<Object> get props => [id];
}

class VehicleClearSelectionEvent extends VehicleSelectionEvent{
   @override
  List<Object> get props => [];
}
