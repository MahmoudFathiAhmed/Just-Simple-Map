import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';

part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  late CameraController controller;
  late List<CameraDescription> _cameras;
  CameraBloc() : super(CameraInitialState()) {
    on<InitCameraEvent>((event, emit) async {
      emit(CameraLoadingState());
      try {
        _cameras = await availableCameras();
        controller = CameraController(
          _cameras.first,
          ResolutionPreset.ultraHigh,
          imageFormatGroup: ImageFormatGroup.yuv420,
        );
        await controller.initialize();
        emit(CameraReadyState());
      } on CameraException catch (e) {
        emit(CameraErrorState(e.description!));
      }
    });
    on<TakePictureEvent>((event, emit) async {
      try {
        await controller.setFlashMode(FlashMode.off);
        XFile picture = await controller.takePicture();
        emit(PictureTakenState(picture));
      } on CameraException catch (e) {
        debugPrint('Camera Erorr ** :$e');
      }
    });
  }
  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
