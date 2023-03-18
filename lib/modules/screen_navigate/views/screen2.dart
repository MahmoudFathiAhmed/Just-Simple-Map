import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/screen_navigate/models/my_model.dart';

class Screen2 extends StatelessWidget {
  final MyModel myModel;
  const Screen2({super.key, required this.myModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Center(
          child: Text(myModel.name!),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
                  context, Routes.screen3Route,arguments: MyArgument(myModel: MyModel(name: myModel.name)));
          },
          child: const Text('To Screen 3'),
        )
      ]),
    );
  }
}
