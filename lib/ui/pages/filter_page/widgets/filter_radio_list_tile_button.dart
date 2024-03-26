part of '../filter_page.dart';

class FilterRadioListTileButton extends StatefulWidget {
  const FilterRadioListTileButton({
    super.key,
    required this.title,
    required this.localSelectedIndexes,
    required this.index,
  });

  final String title;
  final List<int> localSelectedIndexes;
  final int index;

  @override
  State<FilterRadioListTileButton> createState() =>
      _FilterRadioListTileButtonState();
}

class _FilterRadioListTileButtonState extends State<FilterRadioListTileButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      clipBehavior: Clip.hardEdge,
      decoration: roundedBoxDecoration.copyWith(
          color: AppColors.colorGray80, borderRadius: allCircularRadius12),
      child: SplashButton(
        onTap: () {
          if (widget.localSelectedIndexes.contains(widget.index)) {
            if (widget.localSelectedIndexes.length != 1) {
              widget.localSelectedIndexes.remove(widget.index);
            }
          } else {
            widget.localSelectedIndexes.add(widget.index);
          }
          setState(() {});
        },
        child: Padding(
          padding: kPH11,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.title,
                    style: AppTextStyle.w500s18fSF
                        .copyWith(color: AppColors.colorGray10),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: widget.localSelectedIndexes.contains(widget.index)
                      ? const Icon(
                          CupertinoIcons.checkmark_alt_circle_fill,
                          color: AppColors.colorGreen,
                        )
                      : const Icon(
                          CupertinoIcons.circle,
                          color: AppColors.colorGray10,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
