import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

class PSPrimaryIconButtonStyle {
  final double? width;
  final double? height;
  final Color? disabledColor;
  final Color? borderColor;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color background;
  final EdgeInsets? padding;
  final OutlinedBorder? shape;
  final Color dotColor;

  PSPrimaryIconButtonStyle.defaultTheme(ThemeData theme, {TextStyle? textStyle})
      : borderRadius = BorderRadius.circular(10),
        padding = const EdgeInsets.all(0),
        disabledColor = PSColors.gray03,
        borderColor = PSColors.gray03,
        background = PSColors.primaryColor,
        height = 56,
        width = double.infinity,
        shape = RoundedRectangleBorder(
          side: const BorderSide(
            color: PSColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        dotColor = PSColors.white,
        textAlign = TextAlign.left,
        textStyle = textStyle ?? PSTextStyle.h4Bold(color: PSColors.white);

  PSPrimaryIconButtonStyle.outlineTheme(ThemeData theme, {TextStyle? textStyle})
      : borderRadius = BorderRadius.circular(10),
        padding = const EdgeInsets.all(0),
        disabledColor = PSColors.gray02,
        borderColor = PSColors.gray02,
        background = PSColors.white,
        height = 56,
        width = double.infinity,
        textAlign = TextAlign.left,
        shape = RoundedRectangleBorder(
          side: const BorderSide(color: PSColors.primaryColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        dotColor = PSColors.primaryColor,
        textStyle = const TextStyle(
            fontWeight: FontWeight.w500, color: PSColors.primaryColor);

  PSPrimaryIconButtonStyle.customSizeOutline(
    ThemeData theme, {
    TextStyle? textStyle,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(0),
  })  : borderRadius = BorderRadius.circular(10),
        disabledColor = PSColors.gray02,
        borderColor = PSColors.gray02,
        background = PSColors.white,
        shape = RoundedRectangleBorder(
          side: const BorderSide(
            color: PSColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        dotColor = PSColors.primaryColor,
        textAlign = TextAlign.left,
        textStyle = textStyle ??
            const TextStyle(
                fontWeight: FontWeight.w500, color: PSColors.primaryColor);

  // this.timeInSecond = 2,
  // this.fontSize = Dimens.h4,
  // this.toastLength = Toast.LENGTH_LONG,
  // this.gravity = ToastGravity.BOTTOM,
  // this.textColor = PSColors.textPrimary,
  // }) : background = theme.primaryColor;

  // AppPrimaryButtonStyle.infoTheme(
  //   ThemeData theme, {
  //   this.timeInSecond = 2,
  //   this.fontSize = Dimens.h4,
  //   this.toastLength = Toast.LENGTH_LONG,
  //   this.gravity = ToastGravity.BOTTOM,
  //   this.textColor = PSColors.dark,
  // }) : backgroundColor = theme.canvasColor;
}
