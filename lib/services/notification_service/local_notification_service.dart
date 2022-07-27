import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {

  static LocalNotificationService? _instance;

  static LocalNotificationService get instance {
    if (_instance != null) return _instance!;
    _instance = LocalNotificationService._();
    return _instance!;
  }
  
  LocalNotificationService._();

  final _notifications = FlutterLocalNotificationsPlugin();

  Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "channelId", 
        "channelName",
        channelDescription: "channelDescription",
        priority: Priority.max,
        importance: Importance.max,
        playSound: true,
      ),
      iOS: IOSNotificationDetails(presentSound: true),
    );
  }

  Future init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings("@mipmap/ic_launcher");
    final ios = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(  
      settings,
    );
  }

  Future showNotification({int id=0,String? title,String? body,String? payload}) async {
    _notifications.show(id, title, body, await _notificationDetails(),payload: payload);
  }

}