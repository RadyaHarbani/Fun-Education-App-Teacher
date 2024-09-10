import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/add-management-school-information-page/add_management_school_information_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddManagementSchoolInformationPageView
    extends GetView<AddManagementSchoolInformationPageController> {
  const AddManagementSchoolInformationPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Tambah Kolom Informasi',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            bottom: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Judul Kolom',
                style: tsBodyMediumRegular(blackColor),
                maxLines: 1,
              ),
              SizedBox(height: height * 0.015),
              CommonTextField(
                fieldController: controller.titleController,
                obscureText: false,
                hintText: 'Judul Kolom',
              ),
              SizedBox(height: height * 0.02),
              AutoSizeText(
                'Kolom Deskripsi',
                style: tsBodyMediumRegular(blackColor),
                maxLines: 1,
              ),
              SizedBox(height: height * 0.015),
              Obx(() => Column(
                    children: List.generate(controller.descControllers.length,
                        (index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  fieldController:
                                      controller.descControllers[index],
                                  obscureText: false,
                                  hintText: 'Kolom Deskripsi ${index + 1}',
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              InkWell(
                                onTap: () {
                                  controller.removeDescriptionField(index);
                                },
                                child: Icon(
                                  Icons.delete_rounded,
                                  color: dangerColor,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.015),
                        ],
                      );
                    }),
                  )),
              InkWell(
                onTap: () {
                  controller.addDescriptionField();
                },
                child: AutoSizeText(
                  'Tambah Deskripsi',
                  style: tsBodySmallRegular(blackColor),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: height * 0.05),
              Obx(() => CommonButton(
                    isLoading: controller.isLoadingAddSchoolInformation.value,
                    text: 'Tambah Kolom',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.storeSchoolInformation();
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
