import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/rank-page/bottomsheet_select_period.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/rank-widget/rank_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DetailClassComponentFour extends GetView<DetailClassPageController> {
  const DetailClassComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icRanking.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Peringkat',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: whiteColor,
                  builder: (context) => BottomsheetSelectPeriod(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Obx(() => AutoSizeText(
                            controller.selectedPeriod.value.toString(),
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(blackColor),
                          )),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 25,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: height * 0.02,
            ),
            child: Obx(() {
              if (controller.isLoadingDetailClass.value) {
                return ListView.builder(
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height * 0.01),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: controller.selectedPeriod.value == 'Mingguan'
                      ? controller.leaderboardWeeklyModel.length
                      : controller.leaderboardMonthlyModel.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    Color backgroundContainerColor;
                    switch (index) {
                      case 0:
                        backgroundContainerColor = goldColor.withOpacity(0.3);
                        break;
                      case 1:
                        backgroundContainerColor = silverColor.withOpacity(0.5);
                        break;
                      case 2:
                        backgroundContainerColor = bronzeColor.withOpacity(0.3);
                        break;
                      default:
                        backgroundContainerColor = greyColor.withOpacity(0.05);
                        break;
                    }
                    return controller.selectedPeriod.value == 'Mingguan'
                        ? RankItem(
                            index: index,
                            backgroundContainerColor: backgroundContainerColor,
                            studentName:
                                '${controller.leaderboardWeeklyModel[index].fullName}',
                            point:
                                '${controller.leaderboardWeeklyModel[index].point}',
                          )
                        : RankItem(
                            index: index,
                            backgroundContainerColor: backgroundContainerColor,
                            studentName:
                                '${controller.leaderboardMonthlyModel[index].fullName}',
                            point:
                                '${controller.leaderboardMonthlyModel[index].point}',
                          );
                  },
                );
              }
            }),
          ),
        ),
      ],
    );
  }
}
