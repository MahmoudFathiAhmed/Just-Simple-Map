part of 'tracking_cubit.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();
  @override
  List<Object> get props => [];
}

class TrackingInitial extends TrackingState {}


class GetSourceAndDestinationLoading extends TrackingState {}

class GetSourceAndDestinationSuccess extends TrackingState {
  final TrackingModel trackingModel;

  const GetSourceAndDestinationSuccess(this.trackingModel);

  @override
  List<Object> get props => [trackingModel];
}

class GetSourceAndDestinationError extends TrackingState {
  final String error;

  const GetSourceAndDestinationError(this.error);

  @override
  List<Object> get props => [error];
}