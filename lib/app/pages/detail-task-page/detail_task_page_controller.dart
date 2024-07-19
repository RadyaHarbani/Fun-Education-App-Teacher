import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_response.dart';
import 'package:fun_education_app_teacher/app/api/mark/service/mark_service.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_single_response.dart';
import 'package:fun_education_app_teacher/app/api/task/service/task_service.dart';
import 'package:get/get.dart';

class DetailTaskPageController extends GetxController with SingleGetTickerProviderMixin {
  TabController? tabControllerAll;

  TaskService taskService = TaskService();
  ShowByStatusSingleResponse? showByStatusSingleResponse;
  Rx<ShowByStatusModel> showByTaskIdDetail = ShowByStatusModel().obs;

  MarkService markService = MarkService();
  ShowByTaskIdResponse? showByTaskIdResponse;
  RxList<ShowByTaskIdModel> showByTaskIdList = <ShowByTaskIdModel>[].obs;
  RxList<ShowByTaskIdModel> onProgressList = <ShowByTaskIdModel>[].obs;
  RxList<ShowByTaskIdModel> finishedList = <ShowByTaskIdModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabControllerAll = TabController(length: 2, vsync: this);
    showByTaskId(Get.arguments);
    markShowByTaskId(Get.arguments);
  }

  @override
  void dispose() {
    super.dispose();
    tabControllerAll!.dispose();
  }

  Future showByTaskId(String taskId) async {
    try {
      final response = await taskService.getShowByTaskId(taskId);
      showByStatusSingleResponse = ShowByStatusSingleResponse.fromJson(response.data);
      showByTaskIdDetail.value = showByStatusSingleResponse!.data;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future markShowByTaskId(String taskId) async {
    try {
      final response = await markService.getMarkShowByTaskId(taskId);
      showByTaskIdResponse = ShowByTaskIdResponse.fromJson(response.data);
      showByTaskIdList.value = showByTaskIdResponse!.data;

      onProgressList.value = showByTaskIdList.where((task) => task.status == "Diperiksa").toList();
      finishedList.value = showByTaskIdList.where((task) => task.status == "Selesai").toList();
      
      update();
    } catch (e) {
      print(e);
    }
  }
}
