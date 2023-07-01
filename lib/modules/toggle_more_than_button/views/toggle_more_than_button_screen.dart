import 'package:flutter/material.dart';
import 'package:locations_work/modules/toggle_more_than_button/widgets/toggle_buttons_widget.dart';

class ToggleMoreThanButtonScreen extends StatelessWidget {
  const ToggleMoreThanButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? buttonPressed;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          padding: const EdgeInsets.all(20),

          children: [
            ToggleButtonsWidget(
              onButtonPressed: (description) {
                // Access the pressed button index here
                buttonPressed=description;
                debugPrint('$description pressed');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  debugPrint(buttonPressed??'button 1');
                }, child: const Text('just print selected Button'))
          ],
        ),
      ),
    );
  }
}
