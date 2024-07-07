// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CommonGridImageItem extends StatelessWidget {
  const CommonGridImageItem({
    Key? key,
    required this.imagePath,
    required this.deleteFunction,
  }) : super(key: key);
  final String imagePath;
  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      width: width * 0.2,
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.1),
        image: DecorationImage(
          image: FileImage(
            File(imagePath),
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: deleteFunction,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.01,
          ),
          decoration: BoxDecoration(
            color: blackColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.delete_rounded,
            color: whiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
