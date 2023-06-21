// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// //AIzaSyAHKzJO0s14FyH-RiuQ4buamD6g81Whu7A
// class LiveTrackingScreen extends StatefulWidget {
//   const LiveTrackingScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
// }
//
// class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
//   final Completer<GoogleMapController> _controller = Completer();
//   static const LatLng sourceLocation = LatLng(29.848319, 31.336853);
//   static const LatLng destination = LatLng(30.128611, 31.242222);
//   List<LatLng> polylineCoordinates = [];
//   LocationData? currentLocation;
//
//   void getCurrentLocation()async{
//     Location location = Location();
//     location.getLocation().then((location){
//       currentLocation = location;
//     });
//     location.onLocationChanged.listen((newLoc) {currentLocation = newLoc ;
//     setState(() {
//
//     });
//     });
//   }
//   void getPolyPoints() async {
//     PolylinePoints polyPoints = PolylinePoints();
//     PolylineResult result = await polyPoints.getRouteBetweenCoordinates(
//       'AIzaSyAHKzJO0s14FyH-RiuQ4buamD6g81Whu7A',
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point)=> polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
//       setState(() {});
//     }
//   }
//
//   @override
//   void initState() {
//     getCurrentLocation();
//     getPolyPoints();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Live Tracking Screen'),
//       ),
//       body: currentLocation !=null?GoogleMap(
//         initialCameraPosition:
//             CameraPosition(target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!), zoom: 13.5),
//         polylines: {
//           Polyline(
//               polylineId: const PolylineId('route'),
//               points: polylineCoordinates,
//               color: Colors.indigo,
//               width: 6)
//         },
//         markers: {
//           Marker(markerId: const MarkerId('currentLocation'), position: LatLng(currentLocation!.latitude!,currentLocation!.longitude!)),
//           const Marker(markerId: MarkerId('source'), position: sourceLocation),
//           const Marker(markerId: MarkerId('destination'), position: destination),
//         },
//       ):const Center(child: Text('Loading...')),
//     );
//   }
// }
