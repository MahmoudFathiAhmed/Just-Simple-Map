import 'package:flutter/material.dart';
import 'package:locations_work/modules/just_example/widgets/just_select_row.dart';

class JustExample2 extends StatelessWidget {
  const JustExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          JustSelectRow(onButtonPressed: (buttonSelected) {}),
        ],
      ),
    );
  }
}
