import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapState {
  final LatLng? location;
  final String? error;
  final bool isLoading;
  final List<Marker>? markers;
  MapState({this.location, this.error, this.isLoading = false, this.markers});

  factory MapState.loading() => MapState(isLoading: true);

  factory MapState.loaded(
      LatLng location,
      ) =>
      MapState(location: location);

  factory MapState.error(String error) => MapState(error: error);

  factory MapState.markersLoaded(List<Marker> markers) =>
      MapState(markers: markers);
}
