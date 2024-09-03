import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_detail_image_page.dart';
import 'package:fun_education_app_teacher/app/global-component/common_grid_image_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
        Obx(
          () {
            if (controller.isLoadingDetailMark.value) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: width * 0.02,
                  mainAxisSpacing: height * 0.01,
                  childAspectRatio: 1.4,
                ),
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
            } else if (controller.showByUserIdDetail.value.images == null ||
                controller.showByUserIdDetail.value.images!.isEmpty) {
              return Column(
                children: [
                  SizedBox(height: height * 0.03),
                  SvgPicture.asset(
                    'assets/images/empty_list.svg',
                  ),
                  SizedBox(height: height * 0.01),
                  Center(
                    child: AutoSizeText(
                      'Tidak ada gambar yang dikirim',
                      textAlign: TextAlign.center,
                      group: AutoSizeGroup(),
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                ],
              );
            } else {
              return GridView.builder(
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
              );
            }
          },
        )
      ],
    );
  }
}
