/*
 * 1-just current location
 * 2-location by marker
 * 3-get lat and long
 * 4- location around specific location
 * 
 * notes:
 * compile sdk 33
 * min sdk 21
 * 
 */
import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locations Work',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}

