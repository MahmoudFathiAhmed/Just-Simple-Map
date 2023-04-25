/*
 * 1-just current location
 * 2-location by marker
 * 3-get lat and long
 * 4- location around specific location
 * 
 * notes:
 * compile sdk 33
 * min sdk 21
 * 
 */
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:locations_work/core/helpers/bloc_observer.dart';
import 'package:locations_work/core/helpers/notifications_helper.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/core/routes/app_routes.dart';
import 'package:locations_work/modules/firebase_notifications/local_data_source/database_helper.dart';
import 'package:locations_work/modules/firebase_notifications/views/firebase_notifications_screen.dart';

// late List<CameraDescription> cameras;
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  final time = DateTime.now().millisecondsSinceEpoch;
  final title = message.notification?.title ?? 'no title';
  final body = message.notification?.body ?? 'no body';
  await NotificationDatabase.instance.addNotification(title, body, time);
  Get.to(
    () => const FirebaseNotificationsScreen(),
  );
  debugPrint('${message.notification}');
}

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  final fcmToken = await FirebaseMessaging.instance.getToken();

  debugPrint('********$fcmToken***');
  NotificationsHelper.initializeNotifications();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final title = message.notification?.title ?? 'no title';
    final body = message.notification?.body ?? 'no body';
    await NotificationDatabase.instance.addNotification(title, body, time);
    await NotificationsHelper.showNotification(
      title: title,
      body: body,
    );
  });
  // when i clicked on the notification
  FirebaseMessaging.onMessageOpenedApp.listen((message) async {
    final time = DateTime.now().millisecondsSinceEpoch;
    final title = message.notification?.title ?? 'no title';
    final body = message.notification?.body ?? 'no body';
    await NotificationDatabase.instance.addNotification(title, body, time);
    debugPrint(message.notification?.body);
    Get.to(
      () => const FirebaseNotificationsScreen(),
    );
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  ServicesLocator().init();
  // cameras = await availableCameras();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();
    Bloc.observer = MyBlocObserver();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      title: 'Locations Work',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
          colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.blueAccent,
            onSecondary: Colors.white,
            error: Colors.red,
            onError: Colors.white,
            background: Colors.white,
            onBackground: Colors.black,
            surface: Colors.grey.shade200,
            onSurface: Colors.black,
          ),
          appBarTheme: AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.blue.withOpacity(0.1),
              titleTextStyle: Theme.of(context).textTheme.titleLarge)),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
