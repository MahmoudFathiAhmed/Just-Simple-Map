part of 'get_availability_bloc.dart';

abstract class GetAvailabilityEvent extends Equatable {
  const GetAvailabilityEvent();

  @override
  List<Object> get props => [];
}
class GetWaitingEvent extends GetAvailabilityEvent{
  @override
  List<Object> get props => [];
}
