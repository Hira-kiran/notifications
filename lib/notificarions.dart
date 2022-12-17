import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/main.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  // This function is showing notification both for Andriod and Ios
  void showNotification() async {
// Now we Add details for Andriod
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
            "Message Notification", "Notification for Message",
            channelDescription:
                "This is the message Notification, Tap here to check",
            icon: "Message Icons",
            playSound: true,
            enableLights: true,
            enableVibration: true,
            importance: Importance.max,
            priority: Priority.max);
// Now we Add details for Ios
    DarwinNotificationDetails iosDetails = const DarwinNotificationDetails(
        subtitle: "This is for Ios",
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
        badgeNumber: 1);

    NotificationDetails details =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    // Now show notifications Details
    await notificationsPlugin.show(
        0, "Message Notification", "this is notification", details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
      ),
      body: InkWell(
        onTap: () {
          showNotification();
        },
        child: Center(
          child: Container(
            height: 100,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.notifications,
                  size: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Notification",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
