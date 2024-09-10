import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'edit_management_school_information_page_controller.dart';

class EditManagementSchoolInformationPageView
    extends GetView<EditManagementSchoolInformationPageController> {
  const EditManagementSchoolInformationPageView({super.key});

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
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 15),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Edit Kolom Informasi',
            style: tsBodyMediumSemibold(blackColor)),
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
                                  fieldController: controller
                                      .descControllers[index]['controller'],
                                  obscureText: false,
                                  hintText: 'Kolom Deskripsi ${index + 1}',
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.removeDescriptionField(index);
                                },
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
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
              SizedBox(height: height * 0.44),
              Obx(() => CommonButton(
                    isLoading:
                        controller.isLoadingUpdateSchoolInformation.value,
                    text: 'Simpan Perubahan',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.updateSchoolInformation();
                    },
                  )),
              SizedBox(height: height * 0.01),
              Obx(() => CommonButton(
                    isLoading:
                        controller.isLoadingDeleteSchoolInformation.value,
                    text: 'Hapus Kolom',
                    backgroundColor: dangerColor.withOpacity(0.8),
                    textColor: whiteColor,
                    onPressed: () {
                      controller.deleteSchoolInformation();
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
