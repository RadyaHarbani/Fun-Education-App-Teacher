import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/bottomsheet_add_incoming_note.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/components/bottomsheet_add_outcoming_note.dart';
import 'package:fun_education_app_teacher/app/pages/detail_saving_page/widgets/button_add_transaction.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailSavingPageComponentThree extends StatelessWidget {
  const DetailSavingPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/icNote.svg'),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              group: AutoSizeGroup(),
              maxLines: 1,
              'Catat Transaksi',
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Row(
          children: [
            Expanded(
              child: ButtonAddTransaction(
                typeTransaction: 'Catat Pemasukan',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                    builder: (context) => BottomsheetAddIncomingNote(),
                  );
                },
              ),
            ),
            SizedBox(width: width * 0.02),
            Expanded(
              child: ButtonAddTransaction(
                typeTransaction: 'Catat Pengeluaran',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                    builder: (context) => BottomsheetAddOutcomingNote(),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
