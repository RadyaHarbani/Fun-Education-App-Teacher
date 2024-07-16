import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/components/bottomsheet_detail_photo.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailAlbumPhotoPageComponentTwo extends StatelessWidget {
  const DetailAlbumPhotoPageComponentTwo({super.key, this.arguments});

  final arguments;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          '${arguments.galleryCount} Foto',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumSemibold(blackColor),
        ),
        SizedBox(height: height * 0.02),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: width * 0.01,
            mainAxisSpacing: height * 0.005,
            childAspectRatio: 1.1,
          ),
          itemCount: arguments.gallery!.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: whiteColor,
                  builder: (context) => BottomsheetDetailPhoto(
                    arguments: arguments.gallery![index],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${arguments.gallery![index].image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
