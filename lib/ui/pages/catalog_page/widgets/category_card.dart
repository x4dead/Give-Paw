part of '../catalog_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    const radius24 = Radius.circular(24);
    const radius6 = Radius.circular(6);
    final radius = List.generate(
        7,
        (index) => BorderRadius.only(
              bottomLeft: index == 1 || index == 3 ? radius6 : radius24,
              bottomRight: index == 2 || index == 0 ? radius6 : radius24,
              topLeft:
                  index == 3 || index == 5 || index == 6 ? radius6 : radius24,
              topRight: index == 2 || index == 4 ? radius6 : radius24,
            ));
    return GestureDetector(
      onTap: () {
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     CustomPageRoute(CategoryPage(catalogElements[index].$2)),
        //     (route) => true);
        final param = catalogElementsRouteName[index];
        context
            .go('/catalog/$param', extra: {"title": catalogElements[index].$2});
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            height: context.width <= 340 ? 159 : 169,
            width: context.width <= 340 ? 149 : 159,
            decoration: BoxDecoration(
                gradient: AppColors.listGradients[index],
                borderRadius: radius[index]),
          ),
          Positioned(
            top: 85,
            left: 18,
            child: SizedBox(
                width: 203.52,
                height: 202.8,
                child: ClipOval(
                  child:
                      ColoredBox(color: AppColors.colorWhite.withOpacity(0.17)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(catalogElements[index].$1),
                SizedBox(height: catalogElements[index].$3.toDouble()),
                Text(
                  catalogElements[index].$2,
                  style: index == 2
                      ? AppTextStyle.w700s18
                      : AppTextStyle.w700s20.copyWith(
                          color: index == 6 ? AppColors.colorGray10 : null),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
