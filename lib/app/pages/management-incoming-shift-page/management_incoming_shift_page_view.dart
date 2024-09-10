import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';
import 'package:fun_education_app_teacher/app/pages/management-incoming-shift-page/components/bottomsheet_add_incoming_shift.dart';
import 'package:fun_education_app_teacher/app/pages/management-incoming-shift-page/components/bottomsheet_detail_incoming_shift.dart';
import 'package:fun_education_app_teacher/app/pages/management-incoming-shift-page/management_incoming_shift_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class ManagementIncomingShiftPageView
    extends GetView<ManagementIncomingShiftPageController> {
  const ManagementIncomingShiftPageView({super.key});

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
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Manajemen Shift Masuk',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showAllIncomingShift();
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Selesai',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWarning(
                  backColor: warningColor,
                  text:
                      'Klik shift tertentu jika ingin mengubah atau menghapus data didalamnya',
                ),
                SizedBox(height: height * 0.02),
                Obx(
                  () {
                    if (controller.isLoadingShowAllIncomingShift.value) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.7,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.7,
                        ),
                        itemCount: controller.showAllIncomingShiftModel.length,
                        itemBuilder: (context, index) {
                          return ButtonClass(
                            shiftTime: controller
                                .showAllIncomingShiftModel[index].shiftMasuk!,
                            onTap: () {
                              controller.editShiftController.text = controller
                                  .showAllIncomingShiftModel[index].shiftMasuk!;
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: whiteColor,
                                builder: (context) =>
                                    BottomsheetDetailIncomingShift(
                                  argument: controller
                                      .showAllIncomingShiftModel[index],
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                ),
                SizedBox(
                  height: height * 0.32,
                ),
                CommonButton(
                  text: 'Tambah Shift',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: whiteColor,
                      builder: (context) => BottomsheetAddIncomingShift(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
