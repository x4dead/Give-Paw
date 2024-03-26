import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:give_paw/ui/pages/store_page/data.dart';
import 'package:give_paw/ui/pages/store_page/store_page.dart';

import 'package:give_paw/ui/widgets/custom_app_bar.dart';
import 'package:give_paw/ui/widgets/custom_button.dart';
import 'package:give_paw/ui/widgets/field_from_class.dart';
import 'package:give_paw/ui/widgets/splash_button.dart';
import 'package:go_router/go_router.dart';

part 'widgets/filter_switcher.dart';
part 'widgets/filter_radio_list_tile_button.dart';

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage({super.key});

  @override
  ConsumerState<FilterPage> createState() => _FilterPageConsumerState();
}

class _FilterPageConsumerState extends ConsumerState<FilterPage> {
  final TextEditingController priceFrom = TextEditingController(text: '109');
  final TextEditingController priceTo = TextEditingController(text: '430 985');
  final priceFromFocusNode = FocusNode();
  final priceToFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final List<int> _selectedIndex = [];
    _selectedIndex.addAll(ref.read(selectedPets));
    const pet = [
      ('Кошки', 'cats'),
      ('Собаки', 'dogs'),
      ('Грызуны', 'rodents'),
      ("Птицы", 'birds'),
      ("Рыбки", 'fishes'),
      ("Рептилии", 'reptiles'),
      ('Другие питомцы', 'other'),
    ];
    return Scaffold(
      appBar: CustomAppBar(title: 'Фильтр', leading: (
        SvgPicture.asset(
          AppImages.androidArrowLeft,
          colorFilter: svgColorFilter(color: AppColors.colorGray10),
        ),
        null
      )),
      body: Padding(
        padding: kPH20,
        child: Column(
          children: [
            kSBH10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "Цена",
                    style: AppTextStyle.w500s14
                        .copyWith(color: AppColors.colorGray20),
                  ),
                ),
                kSBH2,
                Row(
                  children: List.generate(2 * 2 - 1, (index) {
                    if (index.isEven) {
                      final itemIndex = index ~/ 2;
                      return Flexible(
                        child: GestureDetector(
                          onTap: () {
                            if (itemIndex == 0) {
                              priceFromFocusNode.requestFocus();
                            } else {
                              priceToFocusNode.requestFocus();
                            }
                          },
                          child: Container(
                            height: 56,
                            decoration: roundedBoxDecoration.copyWith(
                                color: AppColors.colorGray80,
                                borderRadius: allCircularRadius12),
                            padding: kPH20V16,
                            child: Row(
                              children: [
                                Text('${itemIndex == 0 ? 'От' : "До"}:',
                                    style: AppTextStyle.w500s14.copyWith(
                                        color: AppColors.colorGray40)),
                                kSBW8,
                                Flexible(
                                  child: TextField(
                                    focusNode: itemIndex == 0
                                        ? priceFromFocusNode
                                        : priceToFocusNode,
                                    controller:
                                        itemIndex == 0 ? priceFrom : priceTo,
                                    keyboardType: TextInputType.number,
                                    style: AppTextStyle.w500s14,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          FieldFormClass.regExpNumber)
                                    ],
                                    decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return kSBW8;
                  }),
                ),
              ],
            ),
            kSBH10,
            FilterSwitcher(),
            kSBH10,
            const Padding(
                padding: kPH6,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Животное', style: AppTextStyle.w500s18))),
            kSBH10,
            Flexible(
                fit: FlexFit.tight,
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(pet.length * 2 - 1, (index) {
                    if (index.isEven) {
                      final itemIndex = index ~/ 2;
                      return FilterRadioListTileButton(
                        index: itemIndex,
                        localSelectedIndexes: _selectedIndex,
                        title: pet[itemIndex].$1,
                      );
                    }
                    return kSBH10;
                  })),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 21),
              child: CustomButton(
                width: 295,
                height: 56,
                buttonText: 'Готово',
                onTap: () {
                  ref.read(selectedPets.notifier).state = _selectedIndex;
                  ref.read(data.notifier).state = sProducts.where((a) {
                    return _selectedIndex
                        .where((e) => a.petType == pet[e].$2)
                        .isNotEmpty;
                  }).toList();
                  if (ref.watch(selectedPets).length > 2) {
                    ref.read(isSelectedIndex.notifier).state = 3;
                  }
                  if (ref.watch(selectedPets).length == 1) {
                    switch (ref.watch(selectedPets)) {
                      case [1]:
                        ref.read(isSelectedIndex.notifier).state = 1;

                      default:
                        ref.read(isSelectedIndex.notifier).state = 0;
                    }
                  }

                  context.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
