import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ps_ui/theme/theme.dart';

class PSHeadingText extends StatelessWidget {
  final String text;
  final EdgeInsets? linePadding;
  final String image;
  final IconData? icon;
  final Widget? loader;
  final bool isLoading;
  final String? valueInsteadLoader;
  final EdgeInsetsGeometry? outerPadding;
  final bool hideLine;
  final bool isTextLeftAligned;

  const PSHeadingText({
    super.key,
    this.linePadding,
    required this.text,
    // this.lineHeight = 2,
    this.isLoading = false,
    this.outerPadding,
    this.valueInsteadLoader = "",
    this.loader,
    this.icon,
    this.image = "",
    this.hideLine = false,
    this.isTextLeftAligned = true,
  });

  static TextStyle get textStyle =>
      PSTextStyle.h25Bold(color: PSColors.primaryColor);

  @override
  Widget build(BuildContext context) {
    // margin: const EdgeInsets.symmetric(vertical: 16),

    return Padding(
      padding: outerPadding ?? EdgeInsets.zero,
      child: Row(children: [
        // SvgPicture.asset(
        //   AppAssets.icMenu,
        //   color: AppColors.primaryColor,
        // ),
        if (icon != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              icon,
              color: PSColors.primaryColor,
            ),
          ),
        if (image.isNotEmpty)
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                image,
                color: PSColors.primaryColor,
              )
              // Image.asset(
              //   image,
              //   color: AppColors.primaryColor,
              // ),
              ),
        Padding(
          padding: const EdgeInsets.only(right: 24),
          child: Row(
            children: [
              Text(
                text,
                style: textStyle,
              ),
              isLoading
                  ? (loader ?? const SizedBox())
                  : Text(
                      valueInsteadLoader ?? "",
                      style: textStyle,
                    ),
            ],
          ),
        ),
        if (!hideLine)
          Expanded(
              child: Padding(
            padding: linePadding ?? const EdgeInsets.all(0),
            child: Container(
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: PSColors.primaryColor,
              ),
            ),
          )),
      ]),
    );
  }
}
