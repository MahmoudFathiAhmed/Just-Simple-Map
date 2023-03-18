import 'package:flutter/material.dart';
import 'package:locations_work/modules/screen_navigate/models/my_model.dart';

class Screen3 extends StatelessWidget {
  final MyModel myModel;
  const Screen3({super.key, required this.myModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Text('${myModel.name}')],
      ),
    );
  }
}
