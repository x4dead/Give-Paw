import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/extensions/media_query.dart';
import 'package:go_router/go_router.dart';

final selectedNavBar = StateProvider((ref) => 0);

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar(this.navigationShell, {super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntrinsicHeight(
      child: Container(
        padding: kPH20T12B29,
        color: AppColors.colorWhite,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => GestureDetector(
                      onTap: () {
                        if (ref.watch(selectedNavBar) != index) {
                          ref.read(selectedNavBar.notifier).state = index;
                          navigationShell.goBranch(index);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.width >= 364 ? 10 : 4.5),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              bottomNavBarElements[index].$1,
                              colorFilter: svgColorFilter(
                                  color: ref.watch(selectedNavBar) == index
                                      ? AppColors.colorGray10
                                      : AppColors.colorGray60),
                            ),
                            kSBH2,
                            Text(
                              bottomNavBarElements[index].$2,
                              style: AppTextStyle.w600s10Spacing.copyWith(
                                  color: ref.watch(selectedNavBar) == index
                                      ? AppColors.colorGray10
                                      : AppColors.colorGray60),
                            )
                          ],
                        ),
                      ),
                    ))),
      ),
    );
  }
}
