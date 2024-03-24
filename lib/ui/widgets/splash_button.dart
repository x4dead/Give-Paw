import 'package:flutter/material.dart';
import 'package:give_paw/themes/colors/app_colors.dart';

class SplashButton extends StatelessWidget {
  const SplashButton({super.key, this.onTap, this.child, this.highlightColor});
  final VoidCallback? onTap;
  final Widget? child;
  final Color? highlightColor;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.colorTransparent,
      child: InkWell(
        highlightColor: highlightColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
