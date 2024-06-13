import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/components/add_siswa_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/components/add_siswa_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/components/add_siswa_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddSiswaPageView extends GetView<AddSiswaPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: Colors.grey[200],
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            'Tambah Siswa',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddSiswaComponentOne(),
                SizedBox(height: 50),
                AddSiswaComponentTwo(),
                SizedBox(height: 50),
                AddSiswaComponentThree(),
                SizedBox(height: 60),
                CommonButton(
                    text: 'Tambah Siswa',
                    color: primaryColor,
                    onPressed: () {},
                    icon: Icons.add),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
