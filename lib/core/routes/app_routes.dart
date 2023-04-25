import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/camera/views/camera_screen.dart';
import 'package:locations_work/modules/camera/views/picture_preview.dart';
import 'package:locations_work/modules/contact_us/views/contact_us_screen.dart';
import 'package:locations_work/modules/country_code/views/country_code_screen.dart';
import 'package:locations_work/modules/date_time/views/date_time_screen.dart';
import 'package:locations_work/modules/date_time/google_map/views/google_map_screen.dart';
import 'package:locations_work/modules/dictionary/views/dictionary_screen.dart';
import 'package:locations_work/modules/firebase_notifications/views/firebase_notifications_screen.dart';
import 'package:locations_work/modules/just_lat_long/views/just_lat_long_screen.dart';
import 'package:locations_work/modules/lat_long_from_map_screen/views/lat_long_from_map_screen.dart';
import 'package:locations_work/modules/main/views/main_screen.dart';
import 'package:locations_work/modules/notifications/views/notifications_screen.dart';
import 'package:locations_work/modules/radio_list_tile/views/radio_listtile_screen.dart';
import 'package:locations_work/modules/random_colors/views/random_colors_screen.dart';
import 'package:locations_work/modules/screen_navigate/views/screen1.dart';
import 'package:locations_work/modules/screen_navigate/views/screen2.dart';
import 'package:locations_work/modules/screen_navigate/views/screen3.dart';
import 'package:locations_work/modules/update_order/views/select_date_update_order_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String mainScreenRoute = '/mainScreen';
  static const String justlatLongScreenRoute = '/justLatLongScreen';
  static const String noRouteFound = '/noRouteFound';
  static const String googleMapScreenRoute = '/googleMapScreenRoute';
  static const String latLongFromMapScreenRoute = '/latLongFromMapScreenRoute';
  static const String dateTimeScreenRoute = '/dateTimeScreenRoute';
  static const String screen1Route = '/screen1Route';
  static const String screen2Route = '/screen2Route';
  static const String screen3Route = '/screen3Route';
  static const String notificationsScreenRoute = '/notificationsScreenRoute';
  static const String dictionaryScreenRoute = '/dictionaryScreenRoute';
  static const String randomColorScreenRoute = '/randomColorScreenRoute';
  static const String firebaseNotificationsScreenRoute =
      '/firebaseNotificationsScreenRoute';
  static const String selectDateUpdateOrderScreenRoute =
      '/selectDateUpdateOrderScreenRoute';
  static const String countryCodeScreenRoute = '/countryCodeScreenRoute';
  static const String radioScreenRoute = '/radioScreenRoute';
  static const String radioListtileScreenRoute = '/radioListtileScreenRoute';
  static const String contactUsScreenRoute = '/contactUsScreenRoute';
  static const String dateTime1ScreenRoute = '/dateTime1ScreenRoute';
  static const String picturePreviewScreenRoute = '/picturePreviewScreenRoute';
  static const String cameraScreenRoute = '/cameraScreenRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      //initial
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case Routes.mainScreenRoute:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      //lat long screen
      case Routes.justlatLongScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const JustLatLongScreen());
      //google maps screen
      case Routes.googleMapScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const GoogleMapsScreen());
      //date Time Screen
      case Routes.dateTimeScreenRoute:
        return MaterialPageRoute(builder: (context) => const DateTimeScreen());
      case Routes.notificationsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const NotificationsScreen());
      case Routes.dictionaryScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const DictionaryScreen());
      case Routes.randomColorScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RandomColorScreen());
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
      case Routes.firebaseNotificationsScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const FirebaseNotificationsScreen());
      case Routes.selectDateUpdateOrderScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const SelectDateUpdateOrderScreen());
      case Routes.countryCodeScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const CountryCodeScreen());
      case Routes.radioListtileScreenRoute:
        return MaterialPageRoute(
            builder: (context) => const RadioListtileScreen());
      case Routes.contactUsScreenRoute:
        return MaterialPageRoute(builder: (context) => const ContactUsScreen());
      case Routes.picturePreviewScreenRoute:
        PicturePreviewScreenArgs? picturePreviewScreenArgs =
            routeSettings.arguments as PicturePreviewScreenArgs?;
        return MaterialPageRoute(
            builder: (context) => PicturePreviewScreen(
                  file: picturePreviewScreenArgs?.file,
                ));
      case Routes.cameraScreenRoute:
        return MaterialPageRoute(builder: (context) => const CameraScreen());
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
