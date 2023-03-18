import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/main.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(
      cameras[0],
      ResolutionPreset.max,
    );
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      {
        setState(() {});
      }
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            debugPrint('Access was denied');
            break;
          default:
            debugPrint(e.description);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            child: CameraPreview(_controller),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    onPressed: () async {
                      if (!_controller.value.isInitialized) {
                        return null;
                      }
                      if (_controller.value.isTakingPicture) {
                        return null;
                      }

                      try {
                        await _controller.setFlashMode(FlashMode.auto);
                        XFile picture = await _controller.takePicture();
                        Navigator.pushNamed(
                            context, Routes.imagePreviewScreenRoute,
                            arguments: ImagePreviewScreenArgs(picture));
                      } on CameraException catch (e) {
                        debugPrint('Error Occured while taking a picture: $e');
                        return null;
                      }
                    },
                    color: Colors.white,
                    child: const Text('Take a Picture'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
