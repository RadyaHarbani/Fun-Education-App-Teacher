import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailListStudentPageController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabControllerAll;
  var selectedLearningFlow = 'A'.obs;

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
  }
}
