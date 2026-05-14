import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';

class PSContainer extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const PSContainer({
    this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.margin,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: PSColors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        border: Border.all(
          width: PSDimens.commonBorderWidth,
          color: PSColors.cardBorder01,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 8,
            spreadRadius: 0,
            color: PSColors.gray02.withAlpha(140),
          ),
        ],
      ),
      child: child,
    );
  }
}
