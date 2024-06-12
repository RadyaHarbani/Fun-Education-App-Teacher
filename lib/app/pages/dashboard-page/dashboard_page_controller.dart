import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPageController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }
}