import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NorificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  // static Future init({bool initScheduled = false}) async {
  //   await _notifications.initialize(settings, )
  // }

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id", "channel name",
        // channelDescription: ,
        importance: Importance.max,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }
}
