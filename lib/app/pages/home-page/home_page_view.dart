import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/bottomsheet-component/bottomsheet_edit_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/widget/emergency-note-widget/if_contain_emergency_note.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_appbar_component.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/components/home_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/profile-drawer/profile_drawer_view.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: backgroundColor,
      drawer: ProfileDrawerView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.075),
        child: HomePageAppbarComponent(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.02,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            children: [
              IfContainEmergencyNote(
                emergencyNote:
                    'Hari ini hujan deras jangan lupa membawa payung',
                onTapEdit: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => BottomsheetEditEmergencyNote(),
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                },
                onTapDelete: () {},
              ),
              SizedBox(height: height * 0.03),
              HomePageComponentOne(),
              SizedBox(height: height * 0.03),
              HomePageComponentTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
