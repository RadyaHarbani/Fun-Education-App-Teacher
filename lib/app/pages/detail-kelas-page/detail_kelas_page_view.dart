import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-kelas-page/components/bottomsheet_shift_masuk.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailKelasPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => BottomsheetShiftMasuk(),
                        isScrollControlled: true,
                        backgroundColor: whiteColor,
                      );
                    },
                    child: Icon(Icons.edit, color: blackColor, size: 25,)
                  ),
      ),
    );
  }
}