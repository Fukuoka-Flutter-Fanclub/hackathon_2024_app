import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/standalone.dart' as tz;
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';

// デモ動画撮影用に、ボタンを活性化させて120秒後に通知を表示する
Future<void> scheduleNotification() async {
  final tokyo = tz.getLocation('Asia/Tokyo');
  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'お休みの時間です',
    '心を静めて、ゆっくりとお休みください',
    tz.TZDateTime.now(tokyo).add(const Duration(seconds: 120)),
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
}
