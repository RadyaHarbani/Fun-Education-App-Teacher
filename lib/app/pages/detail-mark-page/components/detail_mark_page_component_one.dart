import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailMarkPageComponentOne extends StatelessWidget {
  const DetailMarkPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
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
              // GridView.builder(
              //             shrinkWrap: true,
              //             physics: NeverScrollableScrollPhysics(),
              //             itemCount: controller.imageFileList.length,
              //             gridDelegate:
              //                 SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 3,
              //               crossAxisSpacing: width * 0.02,
              //               mainAxisSpacing: height * 0.01,
              //               childAspectRatio: 1.4,
              //             ),
              //             itemBuilder: (context, index) {
              //               return InkWell(
              //                 onTap: () {
              //                   Get.to(() => CommonDetailImagePage(
              //                         imageFile:
              //                             controller.imageFileList[index],
              //                       ));
              //                 },
              //                 child: CommonGridImageItem(
              //                   imagePath:
              //                       controller.imageFileList[index].path,
              //                   isDelete: false,
              //                 ),
              //               );
              //             },
              //           ),
      ],
    );
  }
}
