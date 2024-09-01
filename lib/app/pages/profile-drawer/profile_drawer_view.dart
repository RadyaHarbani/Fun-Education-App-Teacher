import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileDrawerView extends StatelessWidget {
  final ProfileDrawerController controller = Get.put(ProfileDrawerController());
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Drawer(
      backgroundColor: backgroundColor,
      surfaceTintColor: backgroundColor,
      width: width * 0.85,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Container(
              height: height * 0.05,
              width: width * 0.11,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close, size: 20),
              ),
            ),
            SizedBox(height: height * 0.03),
            Row(
              children: [
                Container(
                  height: height * 0.06,
                  width: width * 0.135,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${homePageController.showCurrentUserModel.value.profilePicture}'),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${homePageController.showCurrentUserModel.value.fullName}',
                      style: tsBodyMediumSemibold(blackColor),
                    ),
                    Text(
                      'Guru',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            AutoSizeText(
              'Kelulusan',
              style: tsBodyMediumRegular(blackColor),
              maxLines: 1,
            ),
            SizedBox(height: height * 0.015),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.GRADUATED_STUDENT_PAGE);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.list_rounded, color: blackColor),
                      SizedBox(width: width * 0.03),
                      AutoSizeText(
                        'Daftar Kelulusan',
                        style: tsBodySmallSemibold(blackColor),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: blackColor,
                    size: 15,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            AutoSizeText(
              'Data Siswa',
              style: tsBodyMediumRegular(blackColor),
              maxLines: 1,
            ),
            SizedBox(height: height * 0.01),
            Container(
              decoration: BoxDecoration(
                color: greenColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.02,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icExcel.svg',
                    ),
                    SizedBox(width: width * 0.03),
                    AutoSizeText(
                      'Export Data Siswa',
                      style: tsBodySmallSemibold(greenColor),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Obx(() => CommonButton(
                  isLoading: controller.isLoadingLogout.value,
                  text: 'Logout',
                  icon: Icons.logout,
                  backgroundColor: dangerColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.logout();
                  },
                )),
          ],
        ),
      ),
    );
  }
}
