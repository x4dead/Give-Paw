import 'package:flutter/material.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';

class ParametersCard extends StatelessWidget {
  const ParametersCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedBoxDecoration.copyWith(
          color: AppColors.colorRed,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          )),
      height: 18,
      padding: kPV4H8,
      child: Center(
        child: Text(
          title,
          style: AppTextStyle.w500s8,
        ),
      ),
    );
  }
}
