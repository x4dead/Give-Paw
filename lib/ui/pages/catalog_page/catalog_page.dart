import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/extensions/media_query.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:give_paw/ui/widgets/splash_button.dart';

part 'widgets/category_card.dart';
part 'widgets/stories_carusel_widget.dart';

class CatalogPage extends ConsumerStatefulWidget {
  const CatalogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CatalogPageState();
}

class _CatalogPageState extends ConsumerState<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    final categories = List.generate(7, (index) {
      return CategoryCard(index: index);
    });
    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            kSBH14,
            const StoriesCaruselWidget(),
            kSBH8,
            Padding(
              padding: kPH20,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                    color: AppColors.colorGray80,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: SplashButton(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 11, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.search,
                          colorFilter: svgColorFilter(),
                        ),
                        kSBW6,
                        Text(
                          'Поиск',
                          style: AppTextStyle.w500s16
                              .copyWith(color: AppColors.colorGray60),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            kSBH12,
            Flexible(
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: context.width <= 330
                      ? 7
                      : context.width <= 345
                          ? 9
                          : context.width <= 355
                              ? 13
                              : 17,
                  spacing: context.width <= 330
                      ? 7
                      : context.width <= 345
                          ? 9
                          : context.width <= 355
                              ? 13
                              : 17,
                  children: categories,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
