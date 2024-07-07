// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CommonMultilineTextfield extends StatelessWidget {
  const CommonMultilineTextfield({
    Key? key,
    required this.maxlines,
    required this.hintText,
    required this.onChanged,
    required this.controller,
  }) : super(key: key);
  final int maxlines;
  final String hintText;
  final Function(String) onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return TextFormField(
      minLines: maxlines,
      maxLines: maxlines,
      keyboardType: TextInputType.multiline,
      obscureText: false,
      cursorColor: blackColor,
      style: tsBodySmallRegular(blackColor),
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.05,
        ),
        filled: true,
        fillColor: whiteColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: defaulBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: defaulBorderRadius,
          borderSide: BorderSide(
            color: transparentColor,
            width: 1.5,
          ),
        ),
        hintText: '$hintText',
        hintStyle: tsBodySmallRegular(greyColor.withOpacity(0.5)),
      ),
      onChanged: onChanged,
    );
  }
}
