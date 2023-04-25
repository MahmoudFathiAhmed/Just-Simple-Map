import 'dart:io';

import 'package:camera/camera.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/camera/bloc/bloc/camera_bloc.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CameraBloc cameraBloc = CameraBloc();
    return BlocProvider(
      create: (context) => cameraBloc..add(InitCameraEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Take a photo'),
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context,Routes.picturePreviewScreenRoute);
            },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        body: BlocConsumer<CameraBloc, CameraState>(
          listener: ((context, state) {
            if (state is PictureTakenState) {
              Navigator.popAndPushNamed(context, Routes.picturePreviewScreenRoute,
                  arguments:
                      PicturePreviewScreenArgs(file: File(state.picture.path)));
            }
          }),
          builder: (context, state) {
            if (state is CameraLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CameraReadyState) {
              return Stack(
                children: [
                  SizedBox(
                    height: double.infinity,
                    child: CameraPreview(cameraBloc.controller),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          child: MaterialButton(
                            onPressed: () {
                              cameraBloc.add(TakePictureEvent());
                            },
                            color: Colors.white,
                            textColor: Colors.black,
                            padding: const EdgeInsets.all(16),
                            shape: const CircleBorder(),
                            child: const Icon(Icons.camera_alt),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is CameraErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
