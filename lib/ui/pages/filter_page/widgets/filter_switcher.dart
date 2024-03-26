part of '../filter_page.dart';

class FilterSwitcher extends ConsumerWidget {
  const FilterSwitcher(this.isOn, {super.key});
  final StateProvider<bool> isOn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onChanged() {
      if (ref.watch(isOn) == true) {
        ref.read(isOn.notifier).state = false;
      } else {
        ref.read(isOn.notifier).state = true;
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
                    value: ref.watch(isOn),
                    onChanged: (v) {
                      onChanged();
                    })
              ],
            )),
      ),
    );
  }
}
