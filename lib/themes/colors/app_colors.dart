import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color colorBlack = Color(0xff13161E);
  static const Color colorWhite = Color(0xffFFFFFF);
  static const Color colorGray10 = Color(0xff1F2633);
  static const Color colorGray20 = Color(0xff2B333E);
  static const Color colorGray40 = Color(0xff667297);
  static const Color colorGray60 = Color(0xff929BB7);
  static const Color colorGray80 = Color(0xffEFF1F7);
  static const Color colorBlue = Color(0xff01A0E2);
  static const Color colorRed = Color(0xffE31E25);
  static const Color colorGreen = Color(0xff027558);
  static const Color colorOrange = Color(0xffFF9901);
  static const Color colorViolet = Color(0xff5C01EB);
  static const Color color1A1A1A = Color(0xff1A1A1A);
  static const Color color353535 = Color(0xff353535);
  static const Color colorSecondaryBlue = Color(0xff8AC9F8);
  static const Color colorSecondaryRed = Color(0xffFFB3AB);
  static const Color colorSecondaryGreen = Color(0xff87D9BB);
  static const Color colorSecondaryOrange = Color(0xffFFDEAD);
  static const Color colorSecondaryViolet = Color(0xffA469FF);

  static const Color colorTetriaryBlue = Color(0xffE3F3FF);
  static const Color colorTetriaryRed = Color(0xffFEDBD3);
  static const Color colorTetriaryOrange = Color(0xffFFF4E4);

  // static const Color colorTertiaryRed = Color(0xffFFE3E3);
  // static const Color colorSearchCard = Color.fromRGBO(197, 207, 235, 0.25);
  static const List<LinearGradient> listGradients = [
    gradientGreenGreen,
    gradienBlueBlue,
    gradientYellowOrange,
    gradientOrangeRed,
    gradientOrangeRed,
    gradientGreenGreen,
    gradientGray
  ];
  static const LinearGradient gradientGray = LinearGradient(
    colors: [colorGray80, colorGray80],
  );
  static const LinearGradient gradientYellowOrange = LinearGradient(colors: [
    Color(0xFFFFD600),
    Color(0xFFFF7A00),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient gradientOrangeRed = LinearGradient(colors: [
    Color(0xFFFF8A00),
    Color(0xFFFF2E00),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const LinearGradient gradientGreenGreen = LinearGradient(colors: [
    Color(0xFF1EB362),
    Color(0xFF027558),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient gradienBlueBlue = LinearGradient(colors: [
    Color(0xFF2ABFFF),
    Color(0xFF005DDC),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static const LinearGradient gradientBlueViolet = LinearGradient(colors: [
    Color(0xFF4200FF),
    Color(0xFF8800C8),
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const Color colorTransparent = Colors.transparent;
}
