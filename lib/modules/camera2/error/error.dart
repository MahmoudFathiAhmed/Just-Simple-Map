import 'package:flutter/material.dart';

class MyError extends StatelessWidget {
  final String message;

  const MyError({super.key, this.message='Camera Error'});



  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            Text(message)
          ]),
    );
  }
}