import 'dart:io';
import 'package:flutter/material.dart';

import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/modules/camera/widgets/press_to_take_a_picture_widget.dart';

class PicturePreviewScreen extends StatelessWidget {
  final File? file;
  const PicturePreviewScreen({
    Key? key,
    this.file,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: file != null
                ? null
                : () {
                    Navigator.pop(context);
                  },
            icon: Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                file == null
                    ? PressToTakeAPictureWidget(
                        text: 'Press to Take a picture before washing the car',
                        onTab: () {
                          // Navigator.popAndPushNamed(
                          //   context,
                          //   Routes.cameraScreenRoute,
                          // );
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.cameraScreenRoute,
                            ModalRoute.withName(Routes.cameraScreenRoute)
                          );
                        },
                      )
                    : Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.file(file!,
                                height: 400, width: 280, fit: BoxFit.cover)),
                      ),
                // const Spacer(),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: file == null ? null : () {},
                  child: const Text('submit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.popAndPushNamed(context, Routes.mainScreenRoute);
                    Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.mainScreenRoute,
                            ModalRoute.withName(Routes.mainScreenRoute)
                          );
                  },
                  child: const Text('to main screen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
