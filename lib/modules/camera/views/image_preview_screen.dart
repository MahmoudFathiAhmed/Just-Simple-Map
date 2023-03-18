// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatefulWidget {
  final XFile file;
  const ImagePreviewScreen({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
}

class _ImagePreviewScreenState extends State<ImagePreviewScreen> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Preview'),
          centerTitle: true,
        ),
        body: Center(child: Image.file(picture)));
  }
}
