import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';

Future<void> showNotification() async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
    'your channel id',
    'your channel name',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
    icon: '@mipmap/ic_launcher',
  );

  const NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    'plain title',
    'plain body',
    notificationDetails,
    payload: 'item x',
  );
}

Future<void> scheduleNotification() async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'テスト',
    '寝ましょう',
    _nextInstance(),
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        icon: '@mipmap/ic_launcher',
      ),
      iOS: DarwinNotificationDetails(
        badgeNumber: 1,
      ),
    ),
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
  final scheduledTime = _nextInstance();
  print(scheduledTime);
}

tz.TZDateTime _nextInstance() {
  final tokyo = tz.getLocation('Asia/Tokyo');
  final now = tz.TZDateTime.now(tokyo);
  tz.TZDateTime scheduledDate =
      tz.TZDateTime(tokyo, now.year, now.month, now.day, 18, 40);
  return scheduledDate;
}
