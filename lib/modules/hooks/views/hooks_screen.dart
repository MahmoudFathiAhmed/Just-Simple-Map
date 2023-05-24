import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';

class HooksScreen extends StatelessWidget {
  const HooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //use state create variable and listen to change => setState
    //use effect => like init state and dispose but avoid using them
    //useMemoized => enable caching in app
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.firstHookRoute);
                },
                child: const Text('first hook')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.secondHookRoute);
                },
                child: const Text('second hook')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.thirdHookRoute);
                },
                child: const Text('third hook')),
          ],
        ),
      ),
    );
  }
}
