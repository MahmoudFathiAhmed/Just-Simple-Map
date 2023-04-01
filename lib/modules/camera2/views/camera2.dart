import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/camera2/blocs/bloc/camera_bloc.dart';
import 'package:locations_work/modules/camera2/error/error.dart';
import 'package:locations_work/modules/camera2/keys/keys.dart';

class Camera2Screen extends StatefulWidget {
  const Camera2Screen({super.key});

  @override
  State<Camera2Screen> createState() => _Camera2ScreenState();
}

class _Camera2ScreenState extends State<Camera2Screen>
    with WidgetsBindingObserver {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CameraBloc>(context);

    // App state changed before we got the chance to initialize.
    if (!bloc.isInitialized()) return;

    if (state == AppLifecycleState.inactive) {
      bloc.add(CameraStopped());
    } else if (state == AppLifecycleState.resumed) {
      bloc.add(CameraInitialized());
    }
  }

  @override
  Widget build(BuildContext context)=>BlocConsumer<CameraBloc, CameraState>(
      listener: (_, state) {
        if (state is CameraCaptureSuccess) {
          Navigator.of(context).pop(state.path);
        } else if (state is CameraCaptureFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            key: MyPhotosKeys.errorSnackBar,
            content: Text(state.error),
          ));
        }
      },
      builder: (context, state)=> Scaffold(
          key: globalKey,
          backgroundColor: Colors.black,
          appBar: AppBar(title: const Text("Camera")),
          body: state is CameraReady
                ? Container(
                    key: MyPhotosKeys.cameraPreviewScreen,
                    child: CameraPreview(
                        BlocProvider.of<CameraBloc>(context).getController()))
                : state is CameraFailure
                    ? MyError(key: MyPhotosKeys.errorScreen, message: state.error)
                    : Container(
                        key: MyPhotosKeys.emptyContainerScreen,
                      ),
          floatingActionButton: state is CameraReady
              ? FloatingActionButton(
                  child: const Icon(Icons.camera_alt),
                  onPressed: () => BlocProvider.of<CameraBloc>(context)
                      .add(CameraCaptured()),
                )
              : Container(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        )
    ); 
}
