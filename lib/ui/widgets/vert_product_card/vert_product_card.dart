import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:give_paw/model/product_model.dart';
import 'package:give_paw/themes/colors/app_colors.dart';
import 'package:give_paw/themes/text_style/text_style.dart';
import 'package:give_paw/themes/utils/constants/ui_constants.dart';
import 'package:give_paw/themes/utils/extensions/converting.dart';
import 'package:give_paw/themes/utils/resources/app_images.dart';
import 'package:give_paw/ui/widgets/parameters_card.dart';
import 'package:give_paw/ui/widgets/splash_button.dart';

part 'widgets/sum_products_card.dart';
part 'widgets/price_busket_view_widget.dart';

class VertProductCard extends ConsumerStatefulWidget {
  const VertProductCard({super.key, required this.product});
  final ProductModel product;

  @override
  ConsumerState<VertProductCard> createState() =>
      _VertProductCardConsumerState();
}

class _VertProductCardConsumerState extends ConsumerState<VertProductCard> {
  final StateProvider<int> count = StateProvider<int>((ref) => 1);

  late final StateProvider<int> price = StateProvider<int>(
      (ref) => widget.product.discountPrice ?? widget.product.previousPrice!);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 166,
      clipBehavior: Clip.hardEdge,
      decoration: roundedBoxDecoration.copyWith(
        borderRadius: allCircularRadius12,
        // color: AppColors.color353535,
      ),
      // padding: kPAll4,
      child: SplashButton(
        highlightColor: AppColors.colorGray60.withOpacity(0.01),
        onTap: () {},
        child: Padding(
          padding: kPAll4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.product.imgs?[0] ?? "",
                    height: 158,
                    width: 158,
                    fit: BoxFit.fitWidth,
                    errorWidget: (context, url, error) =>
                        Center(child: Text('error')),
                  ),
                  if (widget.product.topSeller == true)
                    const Positioned(
                        left: 8,
                        top: 8,
                        child: ParametersCard(title: 'Лидер продаж')),
                  if (widget.product.discountPrice != null)
                    Positioned(
                        left: 8,
                        bottom: 10,
                        child: ParametersCard(
                            title:
                                "${Converting.getDiscount(widget.product.previousPrice!, widget.product.discountPrice!)}%")),
                ],
              ),
              kSBH10,
              Text(
                widget.product.title!,
                style: AppTextStyle.w500s14
                    .copyWith(overflow: TextOverflow.ellipsis),
                maxLines: 2,
              ),
              kSBH6,
              Text(
                widget.product.inStock == true ? 'В наличии' : 'Нет в наличии',
                style: AppTextStyle.w500s16.copyWith(
                    color: widget.product.inStock == true
                        ? AppColors.colorBlue
                        : AppColors.colorGray40),
              ),
              kSBH10,
              if (widget.product.inStock == true)
                SumProductsCard(
                  onAdd: () {
                    ref.read(price.notifier).state = ref.watch(price) +
                        (widget.product.discountPrice ??
                            widget.product.previousPrice!);
                    ref.read(count.notifier).state = ref.watch(count) + 1;
                  },
                  onRemove: () {
                    if (ref.watch(count) > 1) {
                      ref.read(price.notifier).state = ref.watch(price) -
                          (widget.product.discountPrice ??
                              widget.product.previousPrice!);
                      ref.read(count.notifier).state = ref.watch(count) - 1;
                    }
                  },
                  price: ref.watch(price),
                  productCount: ref.watch(count),
                )
              else
                PriceBusketViewWidget(
                  onBusketTap: () {},
                  onPriceTap: () {},
                  discountPrice: widget.product.discountPrice,
                  previousPrice: widget.product.previousPrice,
                )
            ],
          ),
        ),
      ),
    );
  }
}
