import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

FlutterLocalNotificationsPlugin notificationPlugin = FlutterLocalNotificationsPlugin();

class NotificationManager{

  NotificationManager(){
    init();
  }

  void init() async{
    tz.initializeTimeZones();
    await notificationPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher'),
      ),
    );
  }

  Future<void> scheduleNotification({id, title, body, dateTime}) async{
    notificationPlugin.zonedSchedule(
      id,  //id
      title,
      body,
      tz.TZDateTime.from(dateTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          '0',
          'channel name',
          'channel description',
          styleInformation: InboxStyleInformation(
            [title, body],
            contentTitle: 'Task Reminder',
            summaryText: 'Deadline: 21/9/2021 12:00AM',
          ),
          color: Colors.yellow,
          playSound: true,
          sound: RawResourceAndroidNotificationSound('not_to_late_for_work'),
          priority: Priority.max,
          importance: Importance.max,
          showWhen: true,
          // fullScreenIntent: true,
          enableVibration: true,
          enableLights: true,
        ),
      ),
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

}