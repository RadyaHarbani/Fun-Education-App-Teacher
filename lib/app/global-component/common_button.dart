// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool? isLoading;

  CommonButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.onPressed,
    this.icon,
    this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        width: width,
        height: height * 0.068,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        alignment: Alignment.center,
        child: isLoading == true
            ? SizedBox(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white,
                  size: height * 0.035,
                ),
              )
            : isLoading == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                          text: text,
                          style: tsBodySmallSemibold(textColor),
                        ),
                      ),
                      if (icon != null) ...[
                        SizedBox(width: 10),
                        Icon(
                          icon,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                          text: text,
                          style: tsBodySmallSemibold(textColor),
                        ),
                      ),
                      if (icon != null) ...[
                        SizedBox(width: 10),
                        Icon(
                          icon,
                          color: textColor,
                          size: 18,
                        ),
                      ],
                    ],
                  ),
      ),
    );
  }
}
