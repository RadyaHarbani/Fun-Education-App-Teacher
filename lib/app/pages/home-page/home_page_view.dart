import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/bottomsheet-component/bottomsheet_add_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/bottomsheet-component/bottomsheet_edit_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/emergency-note-widget/if_contain_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_appbar_component.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/emergency-note-widget/if_empty_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_view.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: backgroundColor,
      drawer: ProfileDrawerView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: HomePageAppbarComponent(),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          controller.showLatestEmergencyNote();
          controller.showCurrentUserTeacher();
          controller.showAllIncomingShift();
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
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Padding(
              padding: EdgeInsets.only(
                top: controller.showLatestEmergencyNoteModel.value.catatan !=
                        null
                    ? height * 0.01
                    : height * 0.03,
                bottom: height * 0.03,
                left: width * 0.05,
                right: width * 0.05,
              ),
              child: Column(
                children: [
                  controller.showLatestEmergencyNoteModel.value.catatan != null
                      ? IfContainEmergencyNote(
                          emergencyNote: controller
                              .showLatestEmergencyNoteModel.value.catatan
                              .toString(),
                          informationFile: controller
                              .showLatestEmergencyNoteModel.value.file!,
                          onTapEdit: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: whiteColor,
                              builder: (context) =>
                                  BottomsheetEditEmergencyNote(),
                            );
                          },
                          onTapDelete: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CommonAlertDialog(
                                      title: 'Konfirmasi',
                                      content:
                                          'Apakah kamu yakin untuk menghapus seluruh informasi?',
                                      cancelButtonText: 'Tidak',
                                      confirmButtonText: 'Iya',
                                      onConfirm: () async {
                                        Get.back();
                                        await controller
                                            .deleteEmergencyNoteByAdmin(
                                          controller
                                              .showLatestEmergencyNoteModel
                                              .value
                                              .id!,
                                        );
                                      });
                                });
                          },
                        )
                      : IfEmptyEmergencyNote(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: whiteColor,
                              builder: (context) =>
                                  BottomsheetAddEmergencyNote(),
                            );
                          },
                        ),
                  SizedBox(height: height * 0.03),
                  HomePageComponentOne(),
                  SizedBox(height: height * 0.03),
                  HomePageComponentTwo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
