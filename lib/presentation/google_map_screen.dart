import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/helpers/location_helper.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  static Position? position;
  final Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  static const CameraPosition _startingCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 0.0,
    zoom: 17,
  );

  Set<Marker> markers = {};

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget buildMap() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers: markers,
      initialCameraPosition: _startingCameraPosition,
      onMapCreated: (GoogleMapController controller) {
        _mapController.complete(controller);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getMyCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Google Maps'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              position != null
                  ? Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                          Container(
                            height: 240,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 20,
                                    color: Colors.grey.shade300),
                              ],
                            ),
                            child: buildMap(),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                _goToMyCurrentLocation();
                              },
                              child: const Text('get Current Location'))
                        ])
                  : const Center(
                      child: CircularProgressIndicator(
                        color: Colors.teal,
                      ),
                    ),
              const SizedBox(height: 20),
              Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade300, blurRadius: 10)
                  ],
                ),
                child: Center(
                    child: Text(
                        'current location coord: ${position?.latitude ?? ' '} , ${position?.longitude ?? ' '} ')),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, Routes.latLongFromMapScreenRoute,
                        arguments: LatLonFromMapScreenArgs(
                            position?.longitude ?? 0, position?.latitude ?? 0));
                  },
                  child: const Text('To next screen')),
            ],
          ),
        ),
      ),
    );
  }
}
