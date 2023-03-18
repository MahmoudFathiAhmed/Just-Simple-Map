import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/camera/views/camera_screen.dart';
import 'package:locations_work/modules/camera/views/image_preview_screen.dart';
import 'package:locations_work/modules/date_time/views/date_time_screen.dart';
import 'package:locations_work/modules/date_time/google_map/views/google_map_screen.dart';
import 'package:locations_work/modules/just_lat_long/views/just_lat_long_screen.dart';
import 'package:locations_work/modules/lat_long_from_map_screen/views/lat_long_from_map_screen.dart';
import 'package:locations_work/modules/main/views/main_screen.dart';
import 'package:locations_work/modules/screen_navigate/views/screen1.dart';
import 'package:locations_work/modules/screen_navigate/views/screen2.dart';
import 'package:locations_work/modules/screen_navigate/views/screen3.dart';
import 'package:locations_work/modules/test_module/views/test_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String mainScreenRoute = '/mainScreen';
  static const String justlatLongScreenRoute = '/justLatLongScreen';
  static const String noRouteFound = '/noRouteFound';
  static const String googleMapScreenRoute = '/googleMapScreenRoute';
  static const String latLongFromMapScreenRoute = '/latLongFromMapScreenRoute';
  static const String dateTimeScreenRoute = '/dateTimeScreenRoute';
  static const String testScreenRoute = '/testScreenRoute';
  static const String screen1Route = '/screen1Route';
  static const String screen2Route = '/screen2Route';
  static const String screen3Route = '/screen3Route';
  static const String cameraScreenRoute = '/cameraScreenRoute';
  static const String imagePreviewScreenRoute = '/imagePreviewScreenRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //initial
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      //lat long screen
      case Routes.justlatLongScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const JustLatLongScreen());
      //google maps screen
      case Routes.googleMapScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const GoogleMapsScreen());
      //testScreen
      case Routes.testScreenRoute:
        return MaterialPageRoute(builder: (context) => const TestScreen());
      //date Time Screen
      case Routes.dateTimeScreenRoute:
        return MaterialPageRoute(builder: (context) => const DateTimeScreen());
      case Routes.cameraScreenRoute:
        return MaterialPageRoute(builder: (context) => const CameraScreen());
      case Routes.imagePreviewScreenRoute:
        ImagePreviewScreenArgs imagePreviewScreenArgs =
            routeSettings.arguments as ImagePreviewScreenArgs;
        return MaterialPageRoute(
            builder: (context) => ImagePreviewScreen(file: imagePreviewScreenArgs.file,));
      //lat long from map screen
      case Routes.latLongFromMapScreenRoute:
        LatLonFromMapScreenArgs latLonFromMapScreenArgs =
            routeSettings.arguments as LatLonFromMapScreenArgs;
        return MaterialPageRoute(
            builder: (context) => LatLongFromMapScreen(
                  longitude: latLonFromMapScreenArgs.long,
                  latitude: latLonFromMapScreenArgs.lat,
                ));
      case Routes.screen1Route:
        return MaterialPageRoute(builder: (context) => const Screen1());
      case Routes.screen2Route:
        MyArgument myArgument = routeSettings.arguments as MyArgument;
        return MaterialPageRoute(
            builder: (context) => Screen2(
                  myModel: myArgument.myModel!,
                ));
      case Routes.screen3Route:
        MyArgument myArgument = routeSettings.arguments as MyArgument;
        return MaterialPageRoute(
            builder: (context) => Screen3(myModel: myArgument.myModel!));
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Center(
                child: Text(
                  Routes.noRouteFound,
                  style: TextStyle(color: Colors.pink),
                ),
              ),
            ));
  }
}
