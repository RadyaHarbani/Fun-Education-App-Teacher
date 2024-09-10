import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-desc/service/school_information_desc_service.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/service/school_information_title_service.dart';
import 'package:fun_education_app_teacher/app/pages/management-school-information-page/management_school_information_page_controller.dart';
import 'package:get/get.dart';

class AddManagementSchoolInformationPageController extends GetxController {
  final ManagementSchoolInformationPageController
      managementSchoolInformationPageController =
      Get.put(ManagementSchoolInformationPageController());
  SchoolInformationTitleService schoolInformationTitleService =
      SchoolInformationTitleService();
  SchoolInformationDescService schoolInformationDescService =
      SchoolInformationDescService();
  TextEditingController titleController = TextEditingController();
  RxList<TextEditingController> descControllers = <TextEditingController>[].obs;
  RxBool isLoadingAddSchoolInformation = false.obs;

  @override
  void onInit() {
    super.onInit();
    addDescriptionField();
  }

  void addDescriptionField() {
    descControllers.add(TextEditingController());
  }

  void removeDescriptionField(int index) {
    descControllers[index].dispose();
    descControllers.removeAt(index);
  }

  Future storeSchoolInformation() async {
    
    try {
      isLoadingAddSchoolInformation(true);
      final desc = descControllers.map((e) => e.text).toList();
      final response = await schoolInformationTitleService
          .postStoreSchoolInformationTitle(titleController.text);
      final schoolInformationId = response.data['data']['id'];
      for (var description in desc) {
        await schoolInformationDescService.postStoreSchoolInformationDesc(
          schoolInformationId,
          description,
        );
      }
      await managementSchoolInformationPageController
          .showAllSchoolInformation();
      titleController.clear();
      descControllers.clear();

      update();
      Get.back();
      isLoadingAddSchoolInformation(false);
    } catch (e) {
      isLoadingAddSchoolInformation(false);
      print(e);
    }
  }
}
