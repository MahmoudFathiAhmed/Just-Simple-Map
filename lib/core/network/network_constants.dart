import 'package:google_maps_flutter/google_maps_flutter.dart';

class NetworkConstants {
  static const int apiTimeOut = 60 * 1000;

  static LatLng? washerLocation;
  // API - Database constants
  static const String baseUrl =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/availability.json';
  static const String availabilityApi =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/availability.json';
  static const String availability2Api =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/availability2.json';
  static const String allVehiclesApi =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/all_vehicles.json';
  static const String transApi =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/trans.json';
  static const String getOrder =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/get_order.json';
  static const String tracking =
      'https://mahmoudfathiahmed.github.io/availabity_status_api/tracking_api.json';
}
