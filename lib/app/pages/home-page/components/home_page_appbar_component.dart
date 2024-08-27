import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageAppbarComponent extends GetView<HomePageController> {
  const HomePageAppbarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          left: width * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now())}',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodySmallRegular(blackColor),
            ),
            SizedBox(height: height * 0.002),
            Obx(() => AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 1,
                  TextSpan(
                    text: 'Halo, ',
                    style: tsTitleSmallRegular(blackColor),
                    children: [
                      TextSpan(
                        text:
                            '${controller.showCurrentUserModel.value.fullName}',
                        style: tsTitleSmallSemibold(blackColor),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            right: width * 0.02,
          ),
          child: IconButton(
            icon: Icon(
              Icons.person,
              color: blackColor,
              size: 30,
            ),
            onPressed: () {
              controller.openDrawer();
            },
          ),
        ),
      ],
    );
  }
}
