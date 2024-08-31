// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PdfViewer extends StatelessWidget {
  final String url;
  final String fileName;
  const PdfViewer({
    Key? key,
    required this.url,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '$fileName',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: PDF().cachedFromUrl(
        url,
        placeholder: (double progress) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: height * 0.05,
                ),
              ),
              SizedBox(height: height * 0.02),
              AutoSizeText(
                'Loading... ${progress.toStringAsFixed(1)}%',
                style: tsBodyMediumSemibold(blackColor),
              )
            ],
          ),
        ),
        errorWidget: (dynamic error) => Center(
          child: AutoSizeText(
            'Error: $error',
            style: tsBodyMediumSemibold(blackColor),
          ),
        ),
      ),
    );
  }
}
