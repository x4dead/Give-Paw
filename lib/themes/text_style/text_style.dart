import 'package:flutter/cupertino.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/utils/extensions/figma_height.dart';

abstract class AppTextStyle {
  static const TextStyle w500s18fSF = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.colorGray10,
      fontFamily: 'SF Pro Display');
  static const TextStyle w500s18 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.colorGray20);

  static TextStyle w500s8 = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w500,
      color: AppColors.colorWhite,
      height: 6.0.toFigmaHeight(8));

  // static TextStyle w600s39point47 = TextStyle(
  //   fontSize: 39.47,
  //   height: 48.35.toFigmaHeight(39.47),
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.colorPrimaryBlue,
  // );
  // static const TextStyle w600s32 = TextStyle(
  //   fontSize: 32,
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.colorGray0,
  // );
  // static TextStyle w800s14point45 = TextStyle(
  //   fontSize: 14.45,
  //   height: 18.07.toFigmaHeight(14.45),
  //   fontWeight: FontWeight.w800,
  //   color: AppColors.colorPrimaryBlue,
  // );
  // static TextStyle w800s12point93fSF = TextStyle(
  //   fontSize: 12.93,
  //   height: 15.43.toFigmaHeight(12.93),
  //   fontWeight: FontWeight.w800,
  //   fontFamily: "SF Pro Display",
  //   color: AppColors.colorPrimaryBlue,
  // );
  static TextStyle w600s12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 8.0.toFigmaHeight(12),
    color: AppColors.colorOrange,
  );
  static const TextStyle w600s16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.colorGray20,
  );
  static const TextStyle w600s18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.colorGray20,
  );
  static const TextStyle w600s10Spacing = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      color: AppColors.colorGray10,
      letterSpacing: -0.3);
  static const TextStyle w600s15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle w600s24 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      // height: 17.0.toFigmaHeight(24),
      color: AppColors.colorWhite);

  static const TextStyle w500s14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.colorGray10
      // height: 17.0.toFigmaHeight(14)
      );
  static const TextStyle w500s15 = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle w500s16 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      // height: 19.0.toFigmaHeight(16)
      color: AppColors.colorGray60);
  static const TextStyle w500s16fSF = TextStyle(
      fontFamily: 'SF Pro Display', fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle w500s12 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.colorGray10.withOpacity(0.6));

  static const TextStyle w500s10 =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w500);

  // static TextStyle w500s18Ellipsis = TextStyle(
  //     fontSize: 18,
  //     fontWeight: FontWeight.w500,
  //     overflow: TextOverflow.ellipsis,
  //     height: 13.0.toFigmaHeight(18));

  static const TextStyle w500s18point14 = TextStyle(
    fontSize: 18.14,
    fontWeight: FontWeight.w500,
    // overflow: TextOverflow.ellipsis,
  );
  static const TextStyle w400s16fSF = TextStyle(
      fontFamily: 'SF Pro Display', fontSize: 16, fontWeight: FontWeight.w400);

  // static const TextStyle w400s14 =
  //     TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  static const TextStyle w500s24 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.colorGray10);
  static const TextStyle w600s27 = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle w600s20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.colorGray10);
  static const TextStyle w700s18 = TextStyle(
      fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.colorWhite);
  static const TextStyle w700s20 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.colorWhite);

  static const TextStyle w700s28 = TextStyle(
      fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.colorWhite);

  static const TextStyle w400s12 = TextStyle(
    // height: 24.0.toFigmaHeight(15),
    // letterSpacing: 0.3,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    // color: AppColors.colorDarkGray,
    fontFamily: 'SF Pro Display',
  );
}
