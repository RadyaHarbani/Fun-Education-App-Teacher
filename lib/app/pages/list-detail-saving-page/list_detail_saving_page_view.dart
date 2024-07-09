import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/components/list_detail_saving_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/components/list_detail_saving_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ListDetailSavingPageView extends StatelessWidget {
  const ListDetailSavingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 15,
                ),
              ),
              SizedBox(height: height * 0.025),
              ListDetailSavingPageComponentOne(),
              SizedBox(height: height * 0.02),
              Expanded(
                child: ListDetailSavingPageComponentTwo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
