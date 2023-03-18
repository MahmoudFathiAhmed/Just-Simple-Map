import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/screen_navigate/models/my_model.dart';
import 'package:locations_work/modules/screen_navigate/views/screen2.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: controller,
          ),
          Center(
              child: IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, Routes.screen2Route,arguments: MyArgument(myModel: MyModel(name: controller.text)));
            },
            icon: const Icon(Icons.navigate_next),
          )),
        ],
      ),
    );
  }
}
