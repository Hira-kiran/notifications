import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification/notificarions.dart';

// Now we Initialize notification Globaly because we use this notification everywhere in the app
FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Setting for Andriod
  AndroidInitializationSettings andriodSettings =
      const AndroidInitializationSettings("mipmap/ic_launcher");
  // Initialize Setting for Ios
  DarwinInitializationSettings iosSettings = const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true);
// Now we combine andriod and Ios and make Single notification setting
  InitializationSettings settings =
      InitializationSettings(android: andriodSettings, iOS: iosSettings);
//Now we initialize Notification Plugin
  bool? initalize = await notificationsPlugin.initialize(settings);
  log("Notification $initalize");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications',
      home: Notifications(),
    );
  }
}
