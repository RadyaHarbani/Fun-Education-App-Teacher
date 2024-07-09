import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class DetailAlbumPhotoPageComponentTwo extends StatelessWidget {
  const DetailAlbumPhotoPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          '10 Foto',
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
          itemCount: 10,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.pravatar.cc/50?u=$index',
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
