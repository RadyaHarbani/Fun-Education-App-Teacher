import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-desc/service/school_information_desc_service.dart';
import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/service/school_information_title_service.dart';
import 'package:fun_education_app_teacher/app/pages/management-school-information-page/management_school_information_page_controller.dart';
import 'package:get/get.dart';

class EditManagementSchoolInformationPageController extends GetxController {
  final ManagementSchoolInformationPageController
      managementSchoolInformationPageController =
      Get.put(ManagementSchoolInformationPageController());

  SchoolInformationTitleService schoolInformationTitleService =
      SchoolInformationTitleService();
  SchoolInformationDescService schoolInformationDescService =
      SchoolInformationDescService();

  var idSchoolInformation = ''.obs;
  TextEditingController titleController = TextEditingController();
  RxList<Map<String, dynamic>> descControllers = <Map<String, dynamic>>[].obs;
  RxBool isLoadingUpdateSchoolInformation = false.obs;
  RxBool isLoadingDeleteSchoolInformation = false.obs;

  @override
  void onInit() {
    super.onInit();

    idSchoolInformation.value = Get.arguments['id'];
    titleController.text = Get.arguments['title'];

    final descList = Get.arguments['description'];
    for (var desc in descList) {
      descControllers.add({
        'id': desc.id,
        'controller': TextEditingController(text: desc.body),
      });
    }
  }

  void addDescriptionField() {
    descControllers.add({
      'id': null,
      'controller': TextEditingController(),
    });
  }

  void removeDescriptionField(int index) async {
    final desc = descControllers[index];

    if (desc['id'] != null) {
      await deleteSchoolInformationDesc(desc['id']);
    }

    desc['controller'].dispose();
    descControllers.removeAt(index);
  }

  Future updateSchoolInformation() async {
    try {
      isLoadingUpdateSchoolInformation(true);
      await schoolInformationTitleService.updateSchoolInformationTitle(
        titleController.text,
        idSchoolInformation.value,
      );

      for (var desc in descControllers) {
        final controller = desc['controller'] as TextEditingController;
        final id = desc['id'];

        if (id != null) {
          await schoolInformationDescService.updateSchoolInformationDesc(
              id, idSchoolInformation.value, controller.text);
        } else {
          final response =
              await schoolInformationDescService.postStoreSchoolInformationDesc(
                  idSchoolInformation.value, controller.text);
          desc['id'] = response.data['data']['id'];
        }
      }

      await managementSchoolInformationPageController
          .showAllSchoolInformation();
      update();
      Get.back();
      isLoadingUpdateSchoolInformation(false);
    } catch (e) {
      isLoadingUpdateSchoolInformation(false);
      print(e);
    }
  }

  Future deleteSchoolInformationDesc(String idSchoolInformatioDesc) async {
    try {
      await schoolInformationDescService
          .deleteSchoolInformationDesc(idSchoolInformatioDesc);
    } catch (e) {
      print(e);
    }
  }

  Future deleteSchoolInformation() async {
    try {
      isLoadingDeleteSchoolInformation(true);
      await schoolInformationTitleService.deleteSchoolInformationTitle(
        idSchoolInformation.value,
      );

      await managementSchoolInformationPageController
          .showAllSchoolInformation();

      update();
      Get.back();
      isLoadingDeleteSchoolInformation(false);
    } catch (e) {
      isLoadingDeleteSchoolInformation(false);
      print(e);
    }
  }
}
