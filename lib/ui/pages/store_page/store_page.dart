import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/extensions/media_query.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:give_paw/ui/pages/store_page/data.dart';
import 'package:give_paw/ui/widgets/splash_button.dart';
import 'package:give_paw/ui/widgets/vert_product_card/vert_product_card.dart';
import 'package:go_router/go_router.dart';

class StorePage extends ConsumerStatefulWidget {
  const StorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StorePageState();
}

class _StorePageState extends ConsumerState<StorePage> {
  final StateProvider<int> isSelectedIndex = StateProvider<int>((ref) => 1);
  @override
  Widget build(BuildContext context) {
    // final data = List.generate(sProducts.length, (index) {
    //   return VertProductCard(product: sProducts[index]);
    // });
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(130),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
                child: Column(
                  children: [
                    Row(children: [
                      SizedBox(
                        width: 36,
                        child: IconButton(
                            onPressed: () {
                              // context.go('/catalog');
                              context.pop();
                            },
                            icon: SvgPicture.asset(
                              AppImages.iosArrowLeft,
                              colorFilter:
                                  svgColorFilter(color: AppColors.colorGray10),
                            )),
                      ),
                      kSBW12,
                      Flexible(
                        child: Container(
                          // width: double.infinity,
                          decoration: roundedBoxDecoration.copyWith(
                              color: AppColors.colorGray80),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(style: AppTextStyle.w500s16, 'Корм'),
                                kSBW6,
                                Text('Сухой корм',
                                    style: AppTextStyle.w500s16
                                        .copyWith(color: AppColors.colorGray10))
                              ]),
                        ),
                      ),
                      kSBW12,
                      SizedBox(
                        width: 36,
                        child: IconButton(
                            onPressed: () {
                              // context.go('/catalog');
                              // context.pop();
                            },
                            icon: SvgPicture.asset(
                              AppImages.settings,
                              colorFilter:
                                  svgColorFilter(color: AppColors.colorGray20),
                            )),
                      ),
                    ]),
                    kSBH12,
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2 * 2 - 1, (index) {
                          if (index.isEven) {
                            final itemIndex = index ~/ 2;
                            return Flexible(
                              child: Container(
                                width: double.infinity,
                                height: 46,
                                clipBehavior: Clip.hardEdge,
                                decoration: roundedBoxDecoration.copyWith(
                                    color: itemIndex == 0 &&
                                            ref.watch(isSelectedIndex) == 0
                                        ? AppColors.colorGreen
                                        : itemIndex == 1 &&
                                                ref.watch(isSelectedIndex) == 1
                                            ? AppColors.colorGreen
                                            : AppColors.colorGray80),
                                child: SplashButton(
                                  onTap: () {
                                    if (itemIndex == 1 &&
                                        ref.watch(isSelectedIndex) == 0) {
                                      ref.read(isSelectedIndex.notifier).state =
                                          1;
                                    } else if (itemIndex == 0 &&
                                        ref.watch(isSelectedIndex) == 1) {
                                      ref.read(isSelectedIndex.notifier).state =
                                          0;
                                    }

                                    // ref.watch(isSelected).toggleBool();
                                  },
                                  child: Padding(
                                    ///TODO: ВЫнести константу
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 14),
                                    child: Center(
                                      child: Text(
                                        itemIndex == 0 ? "Кошки" : "Собаки",
                                        style: AppTextStyle.w500s16.copyWith(
                                            color: ref.watch(isSelectedIndex) ==
                                                        1 &&
                                                    itemIndex == 0
                                                ? AppColors.colorGray10
                                                : ref.watch(isSelectedIndex) ==
                                                            0 &&
                                                        itemIndex == 1
                                                    ? AppColors.colorGray10
                                                    : AppColors.colorWhite),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                          return kSBW12;
                        })),
                  ],
                ),
              ),
            ),
            kSBH12,
            Flexible(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width >= 320 && context.width < 375
                            ? 5 * pow(context.width / 320, 1).toDouble()
                            : 20),
                    sliver: SliverGrid.builder(
                      itemCount: sProducts.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 196,
                        mainAxisExtent: 292,
                        crossAxisSpacing:
                            context.width >= 385 && context.width < 500
                                ? 3 * pow(context.width / 385, 8.5).toDouble()
                                : context.width >= 500
                                    ? 30
                                    : 3,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.506,
                      ),
                      itemBuilder: (context, index) {
                        return VertProductCard(product: sProducts[index]);
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(child: kSBH12),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Может быть интересно',
                              style: AppTextStyle.w500s18),
                          Container(
                            clipBehavior: Clip.hardEdge,
                            height: 38,
                            decoration: roundedBoxDecoration.copyWith(
                                color: AppColors.colorGray80),
                            child: SplashButton(
                              onTap: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Center(
                                  child: Text('Еще',
                                      style: AppTextStyle.w500s16.copyWith(
                                          color: AppColors.colorGray10)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: kSBH12),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width >= 320 && context.width < 375
                            ? 5 * pow(context.width / 320, 1).toDouble()
                            : 20),
                    sliver: SliverGrid.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 196,
                        mainAxisExtent: 292,
                        crossAxisSpacing:
                            context.width >= 385 && context.width < 500
                                ? 3 * pow(context.width / 385, 8.5).toDouble()
                                : context.width >= 500
                                    ? 30
                                    : 3,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.506,
                      ),
                      itemBuilder: (context, index) {
                        return VertProductCard(
                            product: interestingProducts[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
