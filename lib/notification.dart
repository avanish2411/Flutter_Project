import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notificationservice/local_notification_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class NotificationModel {
  final String title;
  final String body;
  final DateTime timestamp;

  NotificationModel({
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'],
      body: json['body'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> notificationList = [];

  @override
  void initState() {
    super.initState();

    loadStoredNotifications(); // Load stored notifications on app startup

    // Initialize Firebase Messaging
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        processMessage(message);
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        processMessage(message);
        LocalNotificationService.createanddisplaynotification(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        processMessage(message);
      }
    });
  }

  void processMessage(RemoteMessage message) {
    setState(() {
      NotificationModel newNotification = NotificationModel(
        title: message.notification!.title!,
        body: message.notification!.body!,
        timestamp: DateTime.now(),
      );
      saveNotification(newNotification);
    });
  }

  void loadStoredNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? storedNotifications = prefs.getStringList('notifications');
    if (storedNotifications != null) {
      setState(() {
        notificationList = storedNotifications
            .map((json) => NotificationModel.fromJson(jsonDecode(json)))
            .toList();
      });
    }
  }

  void saveNotification(NotificationModel notification) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notificationList.insert(0, notification);
    List<String> notificationJsonList =
        notificationList.map((notification) => jsonEncode(notification.toJson())).toList();
    prefs.setStringList('notifications', notificationJsonList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: ListView.builder(
        itemCount: notificationList.length,
        reverse: false,
        itemBuilder: (context, index) {
          final notification = notificationList[index];
          final timeAgo = _getTimeAgo(notification.timestamp);
          return Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: Colors.blue,
                ),
              ),
            ),
            child: ListTile(
              title: Text(notification.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body),
                  Text(
                    timeAgo,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else {
      final days = difference.inDays;
      return '$days day${days > 1 ? 's' : ''} ago';
    }
  }
}
