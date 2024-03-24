part of '../vert_product_card.dart';

class PriceBusketViewWidget extends StatelessWidget {
  const PriceBusketViewWidget(
      {super.key,
      required this.onPriceTap,
      required this.onBusketTap,
      this.previousPrice,
      this.discountPrice});
  final VoidCallback onPriceTap;
  final VoidCallback onBusketTap;
  final int? previousPrice;
  final int? discountPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration:
                roundedBoxDecoration.copyWith(color: AppColors.colorWhite),
            child: SplashButton(
              onTap: onPriceTap,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
                child: Row(
                  children: [
                    IntrinsicHeight(
                      child: IntrinsicWidth(
                        child: Stack(
                          children: [
                            const SizedBox(height: 31),
                            if (discountPrice != null) ...[
                              Positioned(
                                // top: 0,
                                child: Text(
                                  '\$$previousPrice',
                                  style: AppTextStyle.w400s12.copyWith(
                                      color: AppColors.colorGray60,
                                      decorationColor: AppColors.colorGray60,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Text(
                                  '\$$discountPrice',
                                  style: AppTextStyle.w500s16.copyWith(
                                      color: AppColors.colorGray10,
                                      decorationStyle:
                                          TextDecorationStyle.wavy),
                                ),
                              )
                            ] else
                              Center(
                                child: Text(
                                  '\$$previousPrice',
                                  style: AppTextStyle.w500s16.copyWith(
                                      color: AppColors.colorGray10,
                                      decorationStyle:
                                          TextDecorationStyle.wavy),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 2),
                    const Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: AppColors.colorGray10,
                    )
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            style: IconButton.styleFrom(
                backgroundColor: AppColors.colorGray80,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            padding: const EdgeInsets.all(9.5),
            onPressed: onBusketTap,
            icon: SvgPicture.asset(
              AppImages.busket,
              colorFilter: svgColorFilter(color: AppColors.colorGray10),
            ),
          )
        ],
      ),
    );
  }
}
