import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/items/rank-page/bottomsheet_select_period.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/rank-widget/rank_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

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
            child: ListView.builder(
              itemCount: 10,
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
                return RankItem(
                  index: index,
                  backgroundContainerColor: backgroundContainerColor,
                  studentName: 'Radya Harbani',
                  point: '1357 Poin',
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
