part of '../filter_page.dart';

final isDiscountProducts = StateProvider((ref) => true);

class FilterSwitcher extends ConsumerWidget {
  const FilterSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onChanged() {
      if (ref.watch(isDiscountProducts) == true) {
        ref.read(isDiscountProducts.notifier).state = false;

        // UserPref.isNotificationsOn = false;
      } else {
        ref.read(isDiscountProducts.notifier).state = true;
        // UserPref.isNotificationsOn = true;
      }
    }

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: roundedBoxDecoration.copyWith(
          color: AppColors.colorGray80, borderRadius: allCircularRadius12),
      child: SplashButton(
        onTap: onChanged,
        child: Padding(
            padding: kPH20V13,
            child: Row(
              children: [
                Text(
                  "Товары со скидкой",
                  style: AppTextStyle.w500s16
                      .copyWith(color: AppColors.colorGray10),
                ),
                spacer,
                CupertinoSwitch(
                    activeColor: AppColors.colorGreen,
                    value: ref.watch(isDiscountProducts),
                    onChanged: (v) {
                      onChanged();
                    })
              ],
            )),
      ),
    );
  }
}
