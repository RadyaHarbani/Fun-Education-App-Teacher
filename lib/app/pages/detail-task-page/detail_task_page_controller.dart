import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_response.dart';
import 'package:fun_education_app_teacher/app/api/mark/service/mark_service.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';
import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_single_response.dart';
import 'package:fun_education_app_teacher/app/api/task/service/task_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailTaskPageController extends GetxController
    with SingleGetTickerProviderMixin {
  final DetailClassPageController detailClassPageController =
      Get.put(DetailClassPageController());
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
      showByStatusSingleResponse =
          ShowByStatusSingleResponse.fromJson(response.data);
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

      onProgressList.value =
          showByTaskIdList.where((task) => task.status == "Diperiksa").toList();
      finishedList.value =
          showByTaskIdList.where((task) => task.status == "Selesai").toList();

      update();
    } catch (e) {
      print(e);
    }
  }

  Future deleteTaskByAdmin(String taskId) async {
    try {
      await taskService.deleteTaskByAdmin(taskId);
      await detailClassPageController
          .showByNewStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showByCloseStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showByArchiveStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showStatusCount(showByTaskIdDetail.value.shift!);
      update();
      Get.back();
      Get.snackbar(
        "Berhasil",
        "Tugas berhasil dihapus",
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      Get.snackbar(
        "Gagal",
        "Tugas gagal dihapus",
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
      print(e);
    }
  }

  Future updateStatusTaskByAdmin(String taskId, String status) async {
    try {
      await taskService.putUpdateStatusTaskByAdmin(taskId, status);
      await detailClassPageController
          .showByNewStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showByCloseStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showByArchiveStatus(showByTaskIdDetail.value.shift!);
      await detailClassPageController
          .showStatusCount(showByTaskIdDetail.value.shift!);

      Get.back();
      update();
      Get.snackbar(
        'Update Successful',
        'Status berhasil diubah',
        backgroundColor: successColor,
        colorText: whiteColor,
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Update Failed',
        'Status gagal diubah',
        backgroundColor: dangerColor,
        colorText: whiteColor,
      );
    }
  }
}
