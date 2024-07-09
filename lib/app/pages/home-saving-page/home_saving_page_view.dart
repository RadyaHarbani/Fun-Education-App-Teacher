import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/button_class.dart';
import 'package:fun_education_app_teacher/app/pages/home-saving-page/home_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class HomeSavingPageView extends GetView<HomeSavingPageController> {
  const HomeSavingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * 0.02,
            horizontal: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'Tabungan Ananda',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsTitleSmallSemibold(blackColor),
              ),
              SizedBox(height: height * 0.03),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ButtonClass(shiftTime: '08.00 - 10.00', onTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
