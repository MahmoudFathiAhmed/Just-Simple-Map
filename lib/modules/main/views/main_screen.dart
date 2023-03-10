import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations Work'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.justlatLongScreenRoute);
              },
              child: const Text('just lat long screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.googleMapScreenRoute);
              },
              child: const Text('google maps screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.dateTimeScreenRoute);
              },
              child: const Text('DateTime screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.testScreenRoute);
              },
              child: const Text('Test screen'),
            ),
          ],
        ),
      ),
    );
  }
}
