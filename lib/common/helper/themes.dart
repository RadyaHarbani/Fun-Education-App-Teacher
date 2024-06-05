import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// COLORS
const Color primaryColor = Color(0xFFEF564B);
const Color backgroundColor = Color(0xFFF5F6FB);
const Color blackColor = Color(0xFF313131);
const Color whiteColor = Color(0xFFFFFFFF);
const Color secondaryColor = Color(0xFF0C276A);
const Color greyColor = Color(0xFF7B7B7B);
const Color warningColor = Color(0xFFFFBE30);
const Color opacityPrimaryColor = Color(0x20EF564B);
const Color opacityGreyColor = Color(0x107B7B7B);
const Color opacitySecondaryColor = Color(0x200C276A);
const Color opacityWhiteColor = Color(0x20FFFFFF);
const Color opacity5SecondaryColor = Color(0x0D0C276A);
const Color greenColor = Color(0xFF0CD644);
const Color blueColor = Color(0xFF00B5C0);
const Color opacity20GreyColor = Color(0x207B7B7B);
const Color opacity5PrimaryColor = Color(0x0DEF564B);
const Color opacityBlackColor = Color(0x0D313131);
const Color opacity50GreyColor = Color(0x507B7B7B);
const Color redColor = Color(0xFFE13F3F);
const Color transparentColor = Colors.transparent;

//BOX SHADOW
BoxShadow shadowBlackBlur15Color5 = BoxShadow(
  color: greyColor.withOpacity(0.5),
  spreadRadius: 0,
  blurRadius: 15,
  offset: const Offset(0, 0),
);

BoxShadow shadowBlackBlur10Color5 = BoxShadow(
  color: greyColor.withOpacity(0.5),
  spreadRadius: 0,
  blurRadius: 10,
  offset: const Offset(0, 0),
);

//BORDER RADIUS
final BorderRadius defaulBorderRadius = BorderRadius.circular(15);

//LOGO
const String logo = 'assets/logo.svg';
const String iconChat = 'assets/icons/chat.svg';
const String iconDocument = 'assets/icons/document.svg';
const String iconTravelCase = 'assets/icons/icTravelCase.svg';
const String iconSPP = 'assets/icons/icSPP.svg';

// FONT SIZES
figmaFontsize(int fontSize) {
  return fontSize * 1.2;
}

tsHeadingLargeBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(28),
  );
}

tsHeadingLargeSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(28),
  );
}

tsHeadingLargeMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(28),
  );
}

tsHeadingLargeRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(28),
  );
}

tsHeadingMediumBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(26),
  );
}

tsHeadingMediumSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(26),
  );
}

tsHeadingMediumMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(26),
  );
}

tsHeadingMediumRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(26),
  );
}

tsHeadingSmallBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(24),
  );
}

tsHeadingSmallSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(24),
  );
}

tsHeadingSmallMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(24),
  );
}

tsHeadingSmallRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(24),
  );
}

tsTitleLargeBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(22),
  );
}

tsTitleLargeSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(22),
  );
}

tsTitleLargeMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(22),
  );
}

tsTitleLargeRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(22),
  );
}

tsTitleMediumBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(20),
  );
}

tsTitleMediumSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(20),
  );
}

tsTitleMediumMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(20),
  );
}

tsTitleMediumRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(20),
  );
}

tsTitleSmallBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(18),
  );
}

tsTitleSmallSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(18),
  );
}

tsTitleSmallMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(18),
  );
}

tsTitleSmallRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(18),
  );
}

tsBodyLargeBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(16),
  );
}

tsBodyLargeSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(16),
  );
}

tsBodyLargeMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(16),
  );
}

tsBodyLargeRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(16),
  );
}

tsBodyMediumBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(14),
  );
}

tsBodyMediumSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(14),
  );
}

tsBodyMediumMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(14),
  );
}

tsBodyMediumRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(14),
  );
}

tsBodySmallBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(12),
  );
}

tsBodySmallSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(12),
  );
}

tsBodySmallMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(12),
  );
}

tsBodySmallRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(12),
  );
}

tsLabelLargeBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(10),
  );
}

tsLabelLargeSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(10),
  );
}

tsLabelLargeMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(10),
  );
}

tsLabelLargeRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(10),
  );
}

tsLabelMediumBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(8),
  );
}

tsLabelMediumSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(8),
  );
}

tsLabelMediumMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(8),
  );
}

tsLabelMediumRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(8),
  );
}

tsLabelSmallBold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w700,
    fontSize: figmaFontsize(5),
  );
}

tsLabelSmallSemibold(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w600,
    fontSize: figmaFontsize(5),
  );
}

tsLabelSmallMedium(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w500,
    fontSize: figmaFontsize(5),
  );
}

tsLabelSmallRegular(Color fontColor) {
  return GoogleFonts.poppins(
    color: fontColor,
    fontWeight: FontWeight.w400,
    fontSize: figmaFontsize(5),
  );
}
