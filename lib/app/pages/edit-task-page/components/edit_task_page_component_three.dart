import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/global-component/common_detail_image_page.dart';
import 'package:fun_education_app_teacher/app/global-component/common_grid_image_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/edit-task-page/edit_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditTaskPageComponentThree extends GetView<EditTaskPageController> {
  EditTaskPageComponentThree({super.key});
  final DetailTaskPageController detailTaskPageController =
      Get.put(DetailTaskPageController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Gambar Deskripsi\n',
            style: tsBodyLargeRegular(blackColor),
            children: [
              TextSpan(
                text: '*Opsional',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Obx(() {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: detailTaskPageController
                    .showByTaskIdDetail.value.images!.length +
                controller.imageFileList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: width * 0.02,
              mainAxisSpacing: height * 0.01,
              childAspectRatio: 1.4,
            ),
            itemBuilder: (context, index) {
              if (index < detailTaskPageController
                  .showByTaskIdDetail.value.images!.length) {
                return InkWell(
                  onTap: () {
                    Get.to(() => CommonDetailImagePage(
                          imagePath: detailTaskPageController
                              .showByTaskIdDetail.value.images![index].image!,
                          isNetwork: true,
                        ));
                  },
                  child: CommonGridImageItem(
                    imagePath: detailTaskPageController
                        .showByTaskIdDetail.value.images![index].image!,
                    isNetwork: true,
                    isDelete: true,
                    deleteFunction: () {
                      controller.deleteTaskImageByAdmin(
                        detailTaskPageController
                            .showByTaskIdDetail.value.images![index].id!,
                      );
                    },
                  ),
                );
              } else {
                final galleryIndex = index -
                    detailTaskPageController
                        .showByTaskIdDetail.value.images!.length;
                return InkWell(
                  onTap: () {
                    Get.to(() => CommonDetailImagePage(
                          imagePath: controller.imageFileList[galleryIndex].path,
                          isNetwork: false,
                        ));
                  },
                  child: CommonGridImageItem(
                    imagePath: controller.imageFileList[galleryIndex].path,
                    isNetwork: false,
                    isDelete: true,
                    deleteFunction: () {
                      controller.deleteImage(galleryIndex);
                    },
                  ),
                );
              }
            },
          );
        }),
        SizedBox(height: height * 0.02),
        CommonButton(
          text: 'Tambah Gambar',
          backgroundColor: greyColor.withOpacity(0.1),
          textColor: blackColor,
          icon: Icons.image_rounded,
          onPressed: () {
            controller.selectImage();
          },
        ),
      ],
    );
  }
}
