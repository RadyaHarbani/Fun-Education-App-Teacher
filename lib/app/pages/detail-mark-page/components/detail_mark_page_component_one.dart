import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_detail_image_page.dart';
import 'package:fun_education_app_teacher/app/global-component/common_grid_image_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailMarkPageComponentOne extends GetView<DetailMarkPageController> {
  const DetailMarkPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/icListTask.svg',
            ),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              'Kirim Tugas',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Obx(() => GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount:
                  controller.showByUserIdDetail.value.images?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: width * 0.02,
                mainAxisSpacing: height * 0.01,
                childAspectRatio: 1.4,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CommonDetailImagePage(
                          imagePath: controller
                              .showByUserIdDetail.value.images![index].image!,
                          isNetwork: true,
                        ));
                  },
                  child: CommonGridImageItem(
                    imagePath: controller
                        .showByUserIdDetail.value.images![index].image!,
                    isDelete: false,
                    isNetwork: true,
                  ),
                );
              },
            )),
      ],
    );
  }
}
