import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMarkPageController extends GetxController {
  var status = 'Dikumpulkan'.obs;
  var mark = 0.obs;
  TextEditingController markController = TextEditingController();

  void changeStatus() {
    status.value = 'Selesai';
    mark.value = int.parse(markController.text);
  }
}
