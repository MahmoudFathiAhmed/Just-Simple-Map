import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/modules/just_example/widgets/just_select_row.dart';

class JustExample1 extends StatelessWidget {
  const JustExample1({super.key});

  @override
  Widget build(BuildContext context) {
    String? isButton1Selected;
    return Scaffold(
      appBar: AppBar(),
      body: StatefulBuilder(builder: (context,setState){
        return ListView(
          padding: const EdgeInsets.all(20),
          children: [
            JustSelectRow(
              onButtonPressed: (buttonSelected) {
                setState((){
                  isButton1Selected = buttonSelected;
                  debugPrint(buttonSelected);
                });
              },
            ),
            const SizedBox(height: 10),
            Center(
              child: isButton1Selected == 'Button 1' || isButton1Selected == null
                  ? const Text('Button 1',style: TextStyle(fontSize: 17,color: Colors.blueGrey),)
                  : const Text('Button 2',style: TextStyle(fontSize: 17,color: Colors.blueGrey),),
            ),
            const SizedBox(height: 10),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed(Routes.justExample2Route);
            }, child: const Text('to just Example 2'))
          ],
        );
      },)
    );
  }
}
