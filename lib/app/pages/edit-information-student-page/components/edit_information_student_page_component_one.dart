import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageComponentOne
    extends GetView<EditInformationStudentPageController> {
  const EditInformationStudentPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          group: AutoSizeGroup(),
          maxLines: 1,
          'Data Diri Siswa',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        CommonTextField(
          obscureText: false,
          hintText: "Nama Lengkap",
          fieldController: controller.fullNameController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: "Nama Panggilan",
          fieldController: controller.nickNameController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: "Jenis Kelamin",
          fieldController: controller.genderController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: 'Tempat, Tanggal Lahir',
          fieldController: controller.placeOfBirthController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: 'Alamat Lengkap',
          fieldController: controller.addressController,
        ),
      ],
    );
  }
}
