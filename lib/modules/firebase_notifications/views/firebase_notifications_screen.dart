import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:locations_work/modules/firebase_notifications/local_data_source/database_helper.dart';

class FirebaseNotificationsScreen extends StatefulWidget {
  const FirebaseNotificationsScreen({super.key,});

  @override
  State<FirebaseNotificationsScreen> createState() => _FirebaseNotificationsScreenState();
}

class _FirebaseNotificationsScreenState extends State<FirebaseNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: NotificationDatabase.instance.getNotifications(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const  Center(child: CircularProgressIndicator());
          }

          final notifications = snapshot.data!;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final title = notification['title'] ?? '';
              final body = notification['body'] ?? '';
              final time = notification['time'] ?? 0;

              final formattedTime = DateFormat('MMM d, yyyy h:mm a')
                  .format(DateTime.fromMillisecondsSinceEpoch(time));

              return ListTile(
                title: Text(title),
                subtitle: Text(body),
                trailing: Text(formattedTime),
              );
            },
          );
        },
      ),
    );
  }
}
