part of 'camera_bloc.dart';
abstract class CameraEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class InitCameraEvent extends CameraEvent {}

class TakePictureEvent extends CameraEvent {}
