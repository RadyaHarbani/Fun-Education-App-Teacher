import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/management-incoming-shift-page/management_incoming_shift_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetDetailIncomingShift
    extends GetView<ManagementIncomingShiftPageController> {
  const BottomsheetDetailIncomingShift({
    super.key,
    required this.argument,
  });

  final argument;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.4 + MediaQuery.of(context).viewInsets.bottom,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.02,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.013,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Detail Shift\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Edit Atau Hapus Jika Diperlukan',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Form(
                key: controller.formKeyShiftEdit,
                child: CommonTextField(
                  fieldController: controller.editShiftController,
                  keyboardType: TextInputType.datetime,
                  obscureText: false,
                  hintText: 'cth : 08.00 - 10.00',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Obx(() => CommonButton(
                        isLoading: controller.isLoadingEditIncomingShift.value,
                        text: 'Simpan',
                        backgroundColor: blackColor,
                        textColor: whiteColor,
                        onPressed: () {
                          controller.updateIncomingShiftByAdmin(
                            argument.id!.toString(),
                            controller.editShiftController.text,
                          );
                        },
                      )),
                ),
                SizedBox(width: width * 0.02),
                Expanded(
                  child: Obx(() => CommonButton(
                        isLoading:
                            controller.isLoadingDeleteIncomingShift.value,
                        text: 'Hapus',
                        backgroundColor: dangerColor.withOpacity(0.9),
                        textColor: whiteColor,
                        onPressed: () {
                          controller.deleteIncomingShiftByAdmin(
                            argument.id!.toString(),
                          );
                        },
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
