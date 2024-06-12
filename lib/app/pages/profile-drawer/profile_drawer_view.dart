import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class ProfileDrawerView extends StatelessWidget {
  const ProfileDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Drawer(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      )),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 26,
          top: 39,
          bottom: 35,
          right: 26,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0), // Space from top
            Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(color: opacity20GreyColor, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {}, icon: Icon(Icons.person, size: 20))),
            SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  height: height * 0.06,
                  width: width * 0.135,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tuti Caidah',
                        style: tsBodyMediumSemibold(blackColor)),
                    Text('Guru', style: tsBodySmallRegular(blackColor)),
                  ],
                ),
              ],
            ),
            Spacer(), // Push the logout button to the bottom
            CommonButton(
                text: 'Logout',
                icon: Icons.logout,
                color: dangerColor,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
