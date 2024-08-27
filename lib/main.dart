import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/push-notification/push_notification_service.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:fun_education_app_teacher/firebase_options.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotificationService.initNotification();
  initializeDateFormatting();

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
