import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/model/product_model.dart';
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

// final isDiscountProducts = StateProvider((ref) => false);
// int? priceFrom;
// int? priceTo;

class FilterPage extends ConsumerStatefulWidget {
  const FilterPage(
    this.data, {
    required this.dataForSort,
    super.key,
    required this.isDiscountProducts,
    required this.priceFrom,
    required this.priceTo,
    required this.selectedPetsIndexes,
    required this.isSelectedButtonsIndex,
  });
  final List<ProductModel> data;
  final StateProvider<List<ProductModel>> dataForSort;
  final StateProvider<bool> isDiscountProducts;
  final StateProvider<int?> priceFrom;
  final StateProvider<int?> priceTo;

  final StateProvider<int> isSelectedButtonsIndex;
  final StateProvider<List<int>> selectedPetsIndexes;
  // final VoidCallback onTap;

  @override
  ConsumerState<FilterPage> createState() => _FilterPageConsumerState();
}

class _FilterPageConsumerState extends ConsumerState<FilterPage> {
  late final TextEditingController _priceFrom =
      TextEditingController(text: ref.read(widget.priceFrom)?.toString());
  late final TextEditingController _priceTo =
      TextEditingController(text: ref.read(widget.priceTo)?.toString());
  final priceFromFocusNode = FocusNode();
  final priceToFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final List<int> _selectedIndex = [];
    _selectedIndex.addAll(ref.read(widget.selectedPetsIndexes));
    final StateProvider<bool> _isDiscountProducts =
        StateProvider((ref) => ref.read(widget.isDiscountProducts));
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
                                        itemIndex == 0 ? _priceFrom : _priceTo,
                                    keyboardType: TextInputType.number,
                                    style: AppTextStyle.w500s14,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          FieldFormClass.regExpNumber)
                                    ],
                                    decoration: InputDecoration(
                                        hintStyle: AppTextStyle.w500s14
                                            .copyWith(
                                                color: AppColors.colorGray40),
                                        hintText:
                                            itemIndex == 0 ? '109' : '430 985',
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
            FilterSwitcher(_isDiscountProducts),
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
                  ///Помещаем локально выбранных животных в глобальную переменную
                  ref.read(widget.selectedPetsIndexes.notifier).state =
                      _selectedIndex;

                  ///Помещаем локальныую переменную в глобальную
                  ref.read(widget.isDiscountProducts.notifier).state =
                      ref.watch(_isDiscountProducts);

                  ///Помещаем локальныую переменную в глобальную
                  if (_priceFrom.text.isNotEmpty) {
                    ref.read(widget.priceFrom.notifier).state =
                        int.parse(_priceFrom.text);
                  }
                  if (_priceTo.text.isNotEmpty) {
                    ref.read(widget.priceTo.notifier).state =
                        int.parse(_priceTo.text);
                  }

                  ///Делаем сортировку по выбранным животным
                  ref.read(widget.dataForSort.notifier).state =
                      widget.data.where((a) {
                    return _selectedIndex
                        .where((e) => a.petType == pet[e].$2)
                        .isNotEmpty;
                  }).toList();

                  ///Если глобальная переменная isDiscountProducts равняется тру
                  if (ref.watch(widget.isDiscountProducts) == true) {
                    ///Делаем сортировку товарам со скидкой
                    ref.read(widget.dataForSort.notifier).state
                        // widget.data
                        = ref
                            .watch(widget.dataForSort)
                            // widget.data
                            .where((a) {
                      return a.discountPrice != null;
                    }).toList();
                  }

                  ///Если хотябы один контроллер не пустой
                  if (_priceFrom.text.isNotEmpty || _priceTo.text.isNotEmpty) {
                    ///Делаем сортировку по цене

                    if (_priceFrom.text.isNotEmpty) {
                      ref.read(widget.dataForSort.notifier).state
                          // widget.data
                          =
                          //  widget.data
                          ref.read(widget.dataForSort).where((a) {
                        return (a.discountPrice ?? a.previousPrice!) >=
                            int.tryParse(_priceFrom.text)!;
                      }).toList();
                    }
                    if (_priceTo.text.isNotEmpty) {
                      ref.read(widget.dataForSort.notifier).state
                          // widget.data
                          =
                          // widget.data
                          ref.read(widget.dataForSort).where((a) {
                        return (a.discountPrice ?? a.previousPrice!) <=
                            int.tryParse(_priceTo.text)!;
                      }).toList();
                    }
                  }
                  if (
                      // widget
                      // .selectedPetsIndexes
                      ref.watch(widget.selectedPetsIndexes).length > 2) {
                    ref.read(widget.isSelectedButtonsIndex.notifier).state
                        // widget.isSelectedButtonsIndex
                        = 3;
                  }
                  if (
                      // widget
                      //       .selectedPetsIndexes
                      ref.watch(widget.selectedPetsIndexes).length == 1) {
                    switch (
                        // widget.selectedPetsIndexes
                        ref.watch(widget.selectedPetsIndexes)) {
                      case [1]:
                        ref.read(widget.isSelectedButtonsIndex.notifier).state
                            // widget.isSelectedButtonsIndex
                            = 1;

                      default:
                        ref.read(widget.isSelectedButtonsIndex.notifier).state
                            // widget.isSelectedButtonsIndex
                            = 0;
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
