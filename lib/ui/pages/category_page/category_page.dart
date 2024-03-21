import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:give_paw/ui/pages/category_page/widgets/chapter_card.dart';
import 'package:give_paw/ui/widgets/custom_app_bar.dart';
import 'package:give_paw/ui/widgets/splash_button.dart';
import 'package:go_router/go_router.dart';

// final getNews = FutureProvider<List<NewsCardModel>>(
//     (ref) async => await ref.read(River.newsPod.notifier).getNews());

class CategoryPage extends ConsumerStatefulWidget {
  const CategoryPage(
    this.title, {
    super.key,
    //  this.routeState
  });
  final String title;

  @override
  ConsumerState<CategoryPage> createState() => _CategoryPageConsumerState();
}

class _CategoryPageConsumerState extends ConsumerState<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    const chapterPages = [
      'Прогулочные костюмы',
      'Ошейники / поводки',
      'Другое'
    ];
    const chapters = [
      'Для Собак',
      'Для Кошек',
      'Грызуны',
      'Птицы',
      'Рыбки',
      'Рептилии',
      'Другие животные',
    ];

    return Scaffold(
      backgroundColor: AppColors.colorWhite,
      body: SafeArea(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: const Size.fromHeight(116),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
                // alignment: Alignment.bottomCenter,

                child: Column(
                  children: [
                    Stack(children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 36,
                          child: IconButton(
                              onPressed: () {
                                context.go('/catalog');
                              },
                              icon: SvgPicture.asset(
                                AppImages.androidArrowLeft,
                                colorFilter: svgColorFilter(
                                    color: AppColors.colorGray10),
                              )),
                        ),
                      ),
                      Align(
                        child: Text(
                          widget.title,
                          style: AppTextStyle.w600s20,
                        ),
                      ),
                    ]),
                    kSBH8,
                    Container(
                      height: 46,
                      clipBehavior: Clip.hardEdge,
                      decoration: roundedBoxDecoration.copyWith(
                          color: AppColors.colorGray80),
                      child: SplashButton(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 11),
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
                  ],
                ),
              ),
            ),
            kSBH8,
            Flexible(
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                      separatorBuilder: (context, index) => kSBH24,
                      itemCount: chapters.length,
                      itemBuilder: (context, index) {
                        final _ = List.generate(chapters.length,
                            (index) => (chapters[index], chapterPages));
                        return ChapterCard(
                          model: _[index],
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
