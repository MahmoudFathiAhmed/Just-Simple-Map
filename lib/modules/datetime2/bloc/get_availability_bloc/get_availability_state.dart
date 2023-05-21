part of 'get_availability_bloc.dart';

abstract class GetAvailabilityState extends Equatable {
  const GetAvailabilityState();

  @override
  List<Object> get props => [];
}

class GetAvailabilityInitial extends GetAvailabilityState {}

class GetAvailabilitySuccessState extends GetAvailabilityState {
  final List<DateTime> notAvailabileList;

  const GetAvailabilitySuccessState(this.notAvailabileList);

  @override
  List<Object> get props => [notAvailabileList];
}

class GetAvailabilityLoadingState extends GetAvailabilityState {}

class GetAvailabilityErrorState extends GetAvailabilityState {
  final String error;

  const GetAvailabilityErrorState(this.error);
  @override
  List<Object> get props => [error];
}
