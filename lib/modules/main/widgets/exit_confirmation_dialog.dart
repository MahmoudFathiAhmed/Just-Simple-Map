import 'dart:io';

import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  final String title;
  final String content;
  final Color bgColor;
  const ExitConfirmationDialog({
    Key? key,
    this.title = 'Are you sure?',
    this.content = 'Do you want to exit the app?',
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      backgroundColor: bgColor,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        MaterialButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        MaterialButton(
          onPressed: () =>
              // Navigator.of(context).pop(true),
              terminateApp(),
          child: const Text('Yes'),
        ),
      ],
    );
  }
}

void terminateApp() {
  exit(0);
}
