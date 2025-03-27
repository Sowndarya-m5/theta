import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter/material.dart';
import '../models/event.dart'; // Ensure you import the Event model

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
    InitializationSettings(android: androidInitSettings);

    await _notificationsPlugin.initialize(initSettings,
        onDidReceiveNotificationResponse: (NotificationResponse response) {
          print("Notification Clicked: ${response.payload}");
        });

    tz.initializeTimeZones();
  }

  static Future<void> scheduleEventNotifications(List<Event> events) async {
    for (int i = 0; i < events.length; i++) {
      final event = events[i];
      DateTime? eventDateTime = _parseDateTime(event.actualDate, event.time);
      if (eventDateTime != null) {
        _scheduleNotification(i, event, eventDateTime.subtract(Duration(days: 1))); // 1 day before
        _scheduleNotification(i + 100, event, eventDateTime.subtract(Duration(hours: 1))); // 1 hour before
        _scheduleNotification(i + 200, event, eventDateTime); // At event time
      }
    }
  }

  static Future<void> _scheduleNotification(int id, Event event, DateTime eventTime) async {
    final tz.TZDateTime scheduleTime = tz.TZDateTime.from(eventTime, tz.local);

    await _notificationsPlugin.zonedSchedule(
      id,
      event.clusterName,
      "${event.title} is happening soon!",
      scheduleTime,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'event_channel',
          'Event Notifications',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, // ✅ Fix 2 applied
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      payload: event.title, // Used for navigation
    );
  }

  static DateTime? _parseDateTime(String date, String time) {
    try {
      final dateParts = date.split('.');
      final timeParts = time.split(' ')[0].split(':');
      final isPM = time.contains('PM');

      int hour = int.parse(timeParts[0]);
      if (isPM && hour < 12) hour += 12;

      return DateTime(
        int.parse(dateParts[2]),  // Year
        int.parse(dateParts[1]),  // Month
        int.parse(dateParts[0]),  // Day
        hour,
        int.parse(timeParts[1]),  // Minutes
      );
    } catch (e) {
      print("Error parsing date/time: $e");
      return null;
    }
  }

  static Future<void> cancelAllNotifications() async {
    await _notificationsPlugin.cancelAll();
  }
}
