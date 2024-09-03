import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePageComponentTwo extends GetView<HomePageController> {
  const HomePageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                itemCount: 5,
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
                    shiftTime:
                        controller.showAllIncomingShiftModel[index].shiftMasuk!,
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_CLASS_PAGE,
                        arguments: controller
                            .showAllIncomingShiftModel[index].id
                            .toString(),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }
}
