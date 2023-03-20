import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/modules/camera2/blocs/bloc/camera_bloc.dart';
import 'package:locations_work/modules/camera2/camera_utils/camera_utils.dart';
import 'package:locations_work/modules/camera2/views/camera2.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _textEditingController = TextEditingController();
  String? path;

    @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

   void openCamera() {
    FocusScope.of(context).requestFocus(FocusNode()); //remove focus
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => CameraBloc(cameraUtils: CameraUtils())
              ..add(CameraInitialized()),
            child: const Camera2Screen(),
          ),
        )).then((value) => setState(() => path = value));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Add photo"),),
          body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name",
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: _textEditingController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Photo",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => openCamera(),
                  )
                ],
              ),
              Expanded(
                child: path != null
                    ? Container(
                        width: double.infinity,
                        child: Image.file(File(path!), fit: BoxFit.cover))
                    : Container(),
              ),
            ],
          ),
        )
    );
  }
}