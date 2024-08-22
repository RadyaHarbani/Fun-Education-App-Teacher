import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class FirebaseApi {
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
  );
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onSelectNotification,
    );
  }

  static Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    final token = await _firebaseMessaging.getToken();
    FirebaseApi.initLocalNotification();
    FirebaseMessaging.onMessage.listen(FirebaseApi.handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(FirebaseApi.handleBackgroundMessage);
    print(token);
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    RemoteNotification notification = message.notification!;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      payload: json.encode(message.data),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    final data = message.data;
    print('Data dari background message: $data');
  }

  static Future<void> handleForegroundMessage(RemoteMessage message) async {
    final data = message.data;
    final classShiftId = _mapShiftToId(data['shift']);

    if (data['route'] != null && classShiftId != null) {
      Get.toNamed(
        Routes.DETAIL_CLASS_PAGE,
        arguments: classShiftId,
      )?.then((_) {
        Get.toNamed(
          Routes.DETAIL_TASK_PAGE,
          arguments: data['tugas_id'],
        )?.then((_) {
          Get.toNamed(
            Routes.DETAIL_MARK_PAGE,
            arguments: data['tugas_user_id'],
          );
        });
      });
    }
  }

  static void onSelectNotification(NotificationResponse details) {
    final payload = json.decode(details.payload!);
    final classShiftId = _mapShiftToId(payload['shift']);

    if (payload['route'] != null && classShiftId != null) {
      Get.toNamed(
        Routes.DETAIL_CLASS_PAGE,
        arguments: classShiftId,
      )?.then((_) {
        Get.toNamed(
          Routes.DETAIL_TASK_PAGE,
          arguments: payload['tugas_id'],
        )?.then((_) {
          Get.toNamed(
            Routes.DETAIL_MARK_PAGE,
            arguments: payload['tugas_user_id'],
          );
        });
      });
    }
  }

  static String? _mapShiftToId(String? shift) {
    switch (shift) {
      case '08.00 - 10.00':
        return '1';
      case '10.00 - 11.30':
        return '2';
      case '11.30 - 13.00':
        return '3';
      case '13.00 - 14.00':
        return '4';
      case '14.00 - 15.00':
        return '5';
      default:
        return null;
    }
  }
}
