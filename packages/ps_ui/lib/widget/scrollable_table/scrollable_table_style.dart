import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSScrollableTableStyle {
  // final double height;
  final Color background;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final double width;
  final TextAlign? textAlign;
  final TextStyle? greyTextStyle;
  final TextStyle? blackTextStyle;
  final BoxBorder tableBorder;
  final BoxBorder separator;
  final List<BoxShadow> shadow;

  PSScrollableTableStyle.defaultTheme(ThemeData theme)
      : background = PSColors.white,
        borderRadius = BorderRadius.circular(4),
        padding = const EdgeInsets.all(0),
        width = double.infinity,
        textAlign = TextAlign.center,
        greyTextStyle = PSTextStyle.h6Regular(color: PSColors.gray03),
        blackTextStyle = PSTextStyle.h6Regular(color: PSColors.black2),
        tableBorder = Border.all(
          width: 0.25,
          color: PSColors.cardBorder,
        ),
        separator = const Border(
          right: BorderSide(
            width: 1,
            color: PSColors.gray01,
          ),
        ),
        shadow = const [
          BoxShadow(
            color: PSColors.cardBoxShadowColor,
            blurRadius: 8,
            offset: Offset(
              0.0, // Move to right 10  horizontally
              4, // Move to bottom 10 Vertically
            ),
            // spreadRadius: 0.4,
          )
        ];
}
