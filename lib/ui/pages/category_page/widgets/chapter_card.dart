part of '../category_page.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({super.key, required this.model});
  final (String, List<String>) model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPH20,
      child: Column(
        children: [
          Row(
            children: [
              kSBW6,
              Text(model.$1, style: AppTextStyle.w500s18),
            ],
          ),
          kSBH12,
          ...List.generate(model.$2.length * 2 - 1, (index) {
            if (index.isEven) {
              final itemIndex = index ~/ 2;
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: roundedBoxDecoration.copyWith(
                    color: AppColors.colorGray80,
                    borderRadius: allCircularRadius12),
                child: SplashButton(
                  onTap: () {
                    Navigator.push(context, CustomPageRoute(const StorePage()));
                  },
                  child: Padding(
                    padding: kPH10V8,
                    child: Row(
                      children: [
                        Ink(
                          height: 44,
                          width: 44,
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: AppColors.colorGray20,
                          ),
                          padding: kPAll7,
                          child: SizedBox(
                            child: SvgPicture.asset(AppImages.zen),
                          ),
                        ),
                        kSBW12,
                        Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            model.$2[itemIndex],
                            style: AppTextStyle.w500s16
                                .copyWith(color: AppColors.color1A1A1A),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: AppColors.color353535,
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
            return kSBH12;
          })
        ],
      ),
    );
  }
}
