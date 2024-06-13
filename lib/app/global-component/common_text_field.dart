import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? fieldController;
  final bool obscureText;
  final Icon? prefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final Function? validator;

  CommonTextField({
    super.key,
    this.fieldController,
    required this.obscureText,
    this.prefixIcon,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // final Size mediaQuery = MediaQuery.of(context).size;
    // final double width = mediaQuery.width;
    // final double height = mediaQuery.height;
    return TextFormField(
      controller: fieldController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: tsBodySmallRegular(blackColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        filled: true,
        fillColor: opacityGreyColor,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(borderRadius: defaulBorderRadius),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: defaulBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: defaulBorderRadius,
          borderSide: BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        hintStyle: tsBodySmallRegular(opacity50GreyColor),
        suffixIcon: suffixIcon,
      ),
      cursorColor: blackColor,
      validator: validator as String? Function(String?)?,
    );
  }
}
