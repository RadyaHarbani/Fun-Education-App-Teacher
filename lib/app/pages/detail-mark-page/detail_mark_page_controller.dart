import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/mark/service/mark_service.dart';
import 'package:get/get.dart';

class DetailMarkPageController extends GetxController {
  // var status = 'Dikumpulkan'.obs;
  // var mark = 0.obs;
  TextEditingController markController = TextEditingController();

  // void changeStatus() {
  //   status.value = 'Selesai';
  //   mark.value = int.parse(markController.text);
  // }

  @override
  void onInit() {
    super.onInit();
    markShowByUserId(Get.arguments);
  }

  MarkService markService = MarkService();
  ShowByUserIdResponse? showByUserIdResponse;
  Rx<ShowByTaskIdModel> showByUserIdDetail = ShowByTaskIdModel().obs;

  Future markShowByUserId(String userId) async {
    try {
      final response = await markService.getMarkShowByUserId(userId);
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showByUserIdDetail.value = showByUserIdResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }
}
