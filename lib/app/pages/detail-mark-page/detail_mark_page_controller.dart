import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';
import 'package:fun_education_app_teacher/app/api/mark/models/show-by-user-id/show_by_user_id_response.dart';
import 'package:fun_education_app_teacher/app/api/mark/service/mark_service.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DetailMarkPageController extends GetxController {
  final DetailTaskPageController detailTaskPageController =
      Get.put(DetailTaskPageController());
      RefreshController refreshController = RefreshController();
  final GlobalKey<FormState> formKeyMark = GlobalKey<FormState>();
  TextEditingController markController = TextEditingController();
  RxBool isLoadingUpdateGrade = false.obs;
  RxBool isLoadingDetailMark = false.obs;

  @override
  void onInit() {
    super.onInit();
    markController.text = '75';
    markShowByUserId(Get.arguments);
  }

  MarkService markService = MarkService();
  ShowByUserIdResponse? showByUserIdResponse;
  Rx<ShowByTaskIdModel> showByUserIdDetail = ShowByTaskIdModel().obs;

  Future markShowByUserId(String userId) async {
    try {
      isLoadingDetailMark(true);
      final response = await markService.getMarkShowByUserId(userId);
      showByUserIdResponse = ShowByUserIdResponse.fromJson(response.data);
      showByUserIdDetail.value = showByUserIdResponse!.data;
      isLoadingDetailMark(false);
      update();
    } catch (e) {
      isLoadingDetailMark(false);
      print(e);
    }
  }

  Future sendGradeByAdmin(String taskUserId) async {
    if (formKeyMark.currentState!.validate()) {
      try {
        isLoadingUpdateGrade(true);
        final response = await markService.putSendGradeByAdmin(
          taskUserId,
          int.parse(markController.text),
        );
        print(response.data);
        await markShowByUserId(taskUserId);
        await detailTaskPageController
            .markShowByTaskId(showByUserIdDetail.value.tugasId.toString());
        Get.back();
        update();
        isLoadingUpdateGrade(false);
      } catch (e) {
        isLoadingUpdateGrade(false);
        print(e);
      }
    }
  }
}
