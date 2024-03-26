import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actionWidget,
  });
  final String? title;
  final (Widget?, VoidCallback?)? leading;
  final Widget? actionWidget;
  @override
  Size get preferredSize => const Size.fromHeight(62);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        width: double.infinity,
        padding: kPH20V12.copyWith(top: 14),
        alignment: Alignment.bottomCenter,
        // decoration: const BoxDecoration(
        // border: Border(
        //     bottom: BorderSide(
        //         width: 1,
        //         style: BorderStyle.solid,
        //         color: AppColors.colorLightGray)
        //         )
        // ),
        child: SizedBox(
          width: double.infinity,
          height: 36,
          child: Stack(children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 36,
                child: IconButton(
                    onPressed: leading?.$2 ??
                        () {
                          context.pop();
                        },
                    icon: leading?.$1 ??
                        SvgPicture.asset(
                          AppImages.iosArrowLeft,
                          colorFilter: svgColorFilter(),
                        )),
              ),
            ),
            Align(
              child: Text(
                title ?? "Аксессуары",
                style: AppTextStyle.w600s20,
              ),
            ),
            if (actionWidget != null)
              Align(alignment: Alignment.centerRight, child: actionWidget)
          ]),
        ),
      ),
    );
  }
}
