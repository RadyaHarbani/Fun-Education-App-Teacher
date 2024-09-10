import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ProfileDrawerComponentOne extends StatelessWidget {
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
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
    );
  }
}
