import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/component/dashboard_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/component/dashboard_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/component/dashboard_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/dashboard-page/component/dashboard_component_three.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DashboardPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardComponentOne(),
                  SizedBox(height: 20),
                  DashboardComponentTwo(),
                  SizedBox(height: 30),
                  DashboardComponentThree(),
                  SizedBox(height: 20),
                  CommonWarning(
                      icon: Icons.info_outline,
                      backColor: warningColor,
                      text:
                          'Cek detail siswa untuk melihat informasi secara keseluruhan'),
                  SizedBox(height: 20),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          DashboardComponentFour(),
                          SizedBox(height: 20)
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
