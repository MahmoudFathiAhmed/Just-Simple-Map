part of 'camera_bloc.dart';

abstract class CameraState extends Equatable {
  @override
  List<Object> get props => [];
}

class CameraInitialState extends CameraState {}

class CameraLoadingState extends CameraState {}

class CameraReadyState extends CameraState {}

class PictureTakenState extends CameraState {
  final XFile picture;

  PictureTakenState(this.picture);
}

class CameraErrorState extends CameraState {
  final String errorMessage;

  CameraErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
