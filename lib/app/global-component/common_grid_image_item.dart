// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CommonGridImageItem extends StatelessWidget {
  const CommonGridImageItem({
    Key? key,
    required this.imagePath,
    required this.isNetwork,
    required this.isDelete,
    this.deleteFunction, 
  }) : super(key: key);
  final String imagePath;
  final bool isNetwork;
  final bool isDelete;
  final VoidCallback? deleteFunction;

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
          image: isNetwork == true ? NetworkImage(imagePath) : FileImage(
            File(imagePath),
          ) as ImageProvider<Object>,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: isDelete == true
          ? InkWell(
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
            )
          : Container(
              height: 0,
              width: 0,
            ),
    );
  }
}
