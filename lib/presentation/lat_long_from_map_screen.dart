import 'package:flutter/material.dart';

class LatLongFromMapScreen extends StatelessWidget {
  final double longitude;
  final double latitude;
  const LatLongFromMapScreen(
      {super.key, required this.longitude, required this.latitude});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('long: $longitude, lat: $latitude')),
    );
  }
}
