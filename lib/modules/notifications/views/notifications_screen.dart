import 'package:flutter/material.dart';
import 'package:locations_work/core/helpers/notifications_helper.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    NotificationsHelper.initializeNotifications();
  }

  // Future<void> initializeNotifications() async {

  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('mipmap/ic_launcher');
  //   const InitializationSettings initializationSettings =
  //       InitializationSettings(android: initializationSettingsAndroid);
  //   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // }

  // Future<void> showNotification() async {
  //   const AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       AndroidNotificationDetails(
  //     '1',
  //     'mahmoud',
  //     channelDescription: 'you\'r flutter Developer',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //     showWhen: false,
  //   );

  //   const NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'Important Message',
  //     'Congratulations,\n You Are A Developer',
  //     platformChannelSpecifics,
  //     payload: 'item x',
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await NotificationsHelper.showNotification(
              title: 'Title',
              body: 'body',
            );
          },
          color: Colors.red,
          child: const Text(
            'notify me',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
