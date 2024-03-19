import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          context.go('/catalog');
        },
        child: Padding(
          padding: kPH45V25,
          child: Center(
            child: SvgPicture.asset(AppImages.logo),
          ),
        ),
      ),
    );
  }
}
