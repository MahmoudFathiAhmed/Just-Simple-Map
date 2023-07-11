import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/utils/image_assets.dart';
import 'package:locations_work/modules/widget_marker/widget/custom_marker_widget.dart';
List<Map<String, dynamic>> data = [
  {
    'id': '1',
    'globalKey': GlobalKey(),
    'position': const LatLng(1.32, 103.80),
    'widget': const CustomMarkerWidget(asset: ImageAssets.faceLogo),
    // 'widget': const CustomMarkerWidget(price: 100),
  },
  {
    'id': '2',
    'globalKey': GlobalKey(),
    'position': const LatLng(1.323, 103.82),
    'widget': const CustomMarkerWidget(asset: ImageAssets.whatsLogo),
    // 'widget': const CustomMarkerWidget(price: 200),
  },
  {
    'id': '3',
    'globalKey': GlobalKey(),
    'position': const LatLng(1.325, 103.87),
    'widget': const CustomMarkerWidget(asset: ImageAssets.twitterLogo),
    // 'widget': const CustomMarkerWidget(price: 300),
  },
];

class WidgetMarkerScreen extends StatefulWidget {
  const WidgetMarkerScreen({super.key});

  @override
  State<WidgetMarkerScreen> createState() => _WidgetMarkerScreenState();
}

class _WidgetMarkerScreenState extends State<WidgetMarkerScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final GlobalKey globalKey = GlobalKey();
  final Map<String, Marker> _markers = {};
  static const CameraPosition _cameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(1.35, 103.8),
    zoom: 12,
  );
  bool _isLoaded = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildCompleted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Markers From Widget')),
      body: _isLoaded
          ? GoogleMap(
              myLocationButtonEnabled: false,
              initialCameraPosition: _cameraPosition,
              markers: _markers.values.toSet(),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
          : ListView(
              children: [
                for (int i = 0; i < data.length; i++)
                  Transform.translate(
                    offset: Offset(
                      -MediaQuery.sizeOf(context).width / 2,
                      -MediaQuery.sizeOf(context).height / 2,
                    ),
                    child: RepaintBoundary(
                      key: data[i]['globalKey'],
                      child: data[i]['widget'],
                    ),
                  )
              ],
            ),
    );
  }

  Future<void> _onBuildCompleted() async {
    await Future.wait(
      data.map((value) async {
        await Future.delayed(const Duration(milliseconds: 1000)); // Add a delay here
        Marker marker = await _generateMarkerFromWidgets(value);
        _markers[marker.markerId.value] = marker;
      }),
    );
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkerFromWidgets(Map<String, dynamic> data) async {
    RenderRepaintBoundary boundary = data['globalKey']
        .currentContext
    !.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 2);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return Marker(
        markerId: MarkerId(data['id']),
        position: data['position'],
        icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List())
    );
  }
}
