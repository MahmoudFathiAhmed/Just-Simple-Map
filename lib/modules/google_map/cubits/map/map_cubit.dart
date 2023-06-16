import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/helpers/app_prefs.dart';
import 'package:locations_work/core/helpers/location_helper.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/network/network_constants.dart';

import 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapState.loading()) {
    getCurrentLocation();
  }

  static MapCubit get(context) => BlocProvider.of(context);

  late Position? position;
  CameraPosition? startingCameraPosition;

  Future<void> getCurrentLocation() async {
    emit(MapState.loading());
    try {
      Position position = await LocationHelper.determinePosition();
      print(
          '${position.latitude}, ${position.longitude}  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
      await getIt
          .get<AppPreferences>()
          .saveWasherLocation(position.latitude, position.longitude);
      NetworkConstants.washerLocation =
          LatLng(position.latitude, position.longitude);
      emit(MapState.loaded(
        LatLng(
          position.latitude,
          position.longitude,
        ),
      ));
    } catch (e) {
      emit(MapState.error(e.toString()));
    }
  }
}
