import 'package:flutter/material.dart';
import 'package:locations_work/core/routes/routes_arguments.dart';
import 'package:locations_work/modules/camera/views/camera_screen.dart';
import 'package:locations_work/modules/camera/views/picture_preview.dart';
import 'package:locations_work/modules/checkbox/views/check_box_screen.dart';
import 'package:locations_work/modules/contact_us/views/contact_us_screen.dart';
import 'package:locations_work/modules/containers/views/containers_screen.dart';
import 'package:locations_work/modules/date_time/views/date_time_screen.dart';
import 'package:locations_work/modules/datetime2/views/date_test_screen.dart';
import 'package:locations_work/modules/datetime2/views/datetime2_screen.dart';
import 'package:locations_work/modules/dictionary/views/dictionary_screen.dart';
import 'package:locations_work/modules/expandable%20widgets/views/expandable_example.dart';
import 'package:locations_work/modules/firebase_notifications/views/firebase_notifications_screen.dart';
import 'package:locations_work/modules/google_map/views/google_map_screen.dart';
import 'package:locations_work/modules/google_map/views/google_map_screen2.dart';
import 'package:locations_work/modules/google_map/views/live_tracking_screen.dart';
import 'package:locations_work/modules/hooks/views/firs_hook_example.dart';
import 'package:locations_work/modules/hooks/views/hooks_screen.dart';
import 'package:locations_work/modules/hooks/views/second_hook_example.dart';
import 'package:locations_work/modules/hooks/views/third_hook_example.dart';
import 'package:locations_work/modules/hydrated/views/counter_screen.dart';
import 'package:locations_work/modules/just_example/views/just_example1.dart';
import 'package:locations_work/modules/just_example/views/just_example2.dart';
import 'package:locations_work/modules/just_lat_long/views/just_lat_long_screen.dart';
import 'package:locations_work/modules/lat_long_from_map_screen/views/lat_long_from_map_screen.dart';
import 'package:locations_work/modules/main/views/main_screen.dart';
import 'package:locations_work/modules/notifications/views/notifications_screen.dart';
import 'package:locations_work/modules/radio_list_tile/views/radio_listtile_screen.dart';
import 'package:locations_work/modules/random_colors/views/random_colors_screen.dart';
import 'package:locations_work/modules/screen_navigate/views/screen1.dart';
import 'package:locations_work/modules/screen_navigate/views/screen2.dart';
import 'package:locations_work/modules/screen_navigate/views/screen3.dart';
import 'package:locations_work/modules/segmented/views/segmented_screen.dart';
import 'package:locations_work/modules/toggle/views/toggle_screen.dart';
import 'package:locations_work/modules/toggle_more_than_button/views/toggle_more_than_button_screen.dart';
import 'package:locations_work/modules/translation/views/trans_screen.dart';
import 'package:locations_work/modules/update_order/views/select_date_update_order_screen.dart';
import 'package:locations_work/modules/widget_marker/views/widget_marker_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String mainScreenRoute = '/mainScreen';
  static const String justlatLongScreenRoute = '/justLatLongScreen';
  static const String noRouteFound = '/noRouteFound';
  static const String googleMapScreenRoute = '/googleMapScreenRoute';
  static const String googleMapScreen2Route = '/googleMapScreen2Route';
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
  static const String radioScreenRoute = '/radioScreenRoute';
  static const String radioListtileScreenRoute = '/radioListtileScreenRoute';
  static const String contactUsScreenRoute = '/contactUsScreenRoute';
  static const String dateTime1ScreenRoute = '/dateTime1ScreenRoute';
  static const String picturePreviewScreenRoute = '/picturePreviewScreenRoute';
  static const String cameraScreenRoute = '/cameraScreenRoute';
  static const String transScreenRoute = '/transScreenRoute';
  static const String dateTime2ScreenRoute = '/dateTime2ScreenRoute';
  static const String hooksRoute = '/hooksRoute';
  static const String firstHookRoute = '/firstHookRoute';
  static const String secondHookRoute = '/secondHookRoute';
  static const String thirdHookRoute = '/thirdHookRoute';
  static const String counterRoute = '/counterRoute';
  static const String dateTestRoute = '/dateTestRoute';
  static const String expandableExampleRoute = '/expandableExampleRoute';
  static const String liveTrackingRoute = '/liveTrackingRoute';
  static const String containersScreenRoute = '/containersScreenRoute';
  static const String checkBoxScreenRoute = '/checkBoxScreenRoute';
  static const String toggleScreenRoute = '/toggleScreenRoute';
  static const String segmentedRoute = '/segmentedRoute';
  static const String toggleMoreThanButtonRoute = '/toggleMoreThanButtonRoute';
  static const String justExample1Route = '/justExample1Route';
  static const String justExample2Route = '/justExample2Route';
  static const String widgetMarkerRoute = '/widgetMarkerRoute';
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
      //google maps screen2
      case Routes.googleMapScreen2Route:
        return MaterialPageRoute(
            builder: (context) => const GoogleMapScreen2());
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
      case Routes.transScreenRoute:
        return MaterialPageRoute(builder: (context) => const TransScreen());
      case Routes.dateTime2ScreenRoute:
        return MaterialPageRoute(builder: (context) => const DateTime2Screen());
      case Routes.hooksRoute:
        return MaterialPageRoute(builder: (context) => const HooksScreen());
      case Routes.firstHookRoute:
        return MaterialPageRoute(builder: (context) => const FirstHookExample());
      case Routes.secondHookRoute:
        return MaterialPageRoute(builder: (context) => const SecondHookExample());
      case Routes.thirdHookRoute:
        return MaterialPageRoute(builder: (context) => const ThirdHookExample());
      case Routes.counterRoute:
        return MaterialPageRoute(builder: (context) => const CounterScreen());
      case Routes.dateTestRoute:
        return MaterialPageRoute(builder: (context) => const DateTestScreen());
      case Routes.expandableExampleRoute:
        return MaterialPageRoute(builder: (context) => const ExpandableExample());
      case Routes.containersScreenRoute:
        return MaterialPageRoute(builder: (context) => const ContainersScreen());
      case Routes.checkBoxScreenRoute:
        return MaterialPageRoute(builder: (context) => const CheckBoxScreen());
      case Routes.toggleScreenRoute:
        return MaterialPageRoute(builder: (context) => const ToggleScreen());
      case Routes.segmentedRoute:
        return MaterialPageRoute(builder: (context) => const SegmentedScreen());
      case Routes.toggleMoreThanButtonRoute:
        return MaterialPageRoute(builder: (context) => const ToggleMoreThanButtonScreen());
      case Routes.justExample1Route:
        return MaterialPageRoute(builder: (context) => const JustExample1());
      case Routes.justExample2Route:
        return MaterialPageRoute(builder: (context) => const JustExample2());
      case Routes.widgetMarkerRoute:
        return MaterialPageRoute(builder: (context) => const WidgetMarkerScreen());
      case Routes.liveTrackingRoute:
        return MaterialPageRoute(builder: (context) => const LiveTrackingScreen());
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
