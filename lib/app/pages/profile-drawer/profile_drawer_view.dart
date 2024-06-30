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
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.05,
          vertical: height * 0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Container(
              height: height * 0.05,
              width: width * 0.11,
              decoration: BoxDecoration(
                border: Border.all(color: greyColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close, size: 20),
              ),
            ),
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
                    Text(
                      'Tuti Caidah',
                      style: tsBodyMediumSemibold(blackColor),
                    ),
                    Text(
                      'Guru',
                      style: tsBodySmallRegular(blackColor),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            CommonButton(
              text: 'Logout',
              icon: Icons.logout,
              color: dangerColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
