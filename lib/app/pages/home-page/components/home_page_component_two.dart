import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class HomePageComponentTwo extends GetView<HomePageController> {
  const HomePageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => GridView.builder(
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
                shiftTime:
                    controller.showAllIncomingShiftModel[index].shiftMasuk!,
                onTap: () {
                  Get.toNamed(
                    Routes.DETAIL_CLASS_PAGE,
                    arguments: controller.showAllIncomingShiftModel[index].id.toString(),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
