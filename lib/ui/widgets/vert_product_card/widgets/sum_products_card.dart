part of '../vert_product_card.dart';

class SumProductsCard extends StatelessWidget {
  const SumProductsCard(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.productCount});
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final int price;
  final int productCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: roundedBoxDecoration.copyWith(color: AppColors.colorGreen),
      padding: kPAll6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 5.5),
                style: IconButton.styleFrom(
                    highlightColor: AppColors.colorWhite.withOpacity(0.05),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                onPressed: onRemove,
                icon: const Icon(
                  CupertinoIcons.minus,
                  color: AppColors.colorWhite,
                )),
          ),
          Column(
            children: [
              Text(
                '$productCount шт',
                style: AppTextStyle.w500s16.copyWith(
                    color: AppColors.colorWhite,
                    height: 18.0.toFigmaHeight(16)),
              ),
              Text(
                '\$$price',
                style: AppTextStyle.w400s12.copyWith(
                    color: AppColors.colorWhite.withOpacity(0.6),
                    height: 13.0.toFigmaHeight(12)),
              )
            ],
          ),
          SizedBox(
            height: 35,
            width: 35,
            child: IconButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 5.5),
                style: IconButton.styleFrom(
                    highlightColor: AppColors.colorWhite.withOpacity(0.05),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)))),
                onPressed: onAdd,
                icon: const Icon(
                  CupertinoIcons.add,
                  color: AppColors.colorWhite,
                )),
          ),
        ],
      ),
    );
  }
}
