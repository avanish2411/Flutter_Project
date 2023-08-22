import 'package:emergex/paper.dart';
import 'package:flutter/material.dart';
import 'package:emergex/event.dart';
import 'package:emergex/home.dart';
import 'Committee.dart';
import 'package:emergex/notification.dart';
import 'splash_screen.dart';

import 'package:emergex/notificationservice/local_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const Screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screen = [
    const HomePage(),
    const EventPage(),
    const Paper(),
    const Committee(),
    const NotificationPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screen),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: "Schedule",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.track_changes_sharp),
              label: "Track",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline),
              label: "Committee",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Notification",
              backgroundColor: Colors.blue),
        ],
      ),
    );
  }
}
