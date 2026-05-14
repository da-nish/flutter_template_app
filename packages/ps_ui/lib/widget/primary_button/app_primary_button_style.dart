import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSPrimaryButtonStyle {
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

  PSPrimaryButtonStyle.defaultTheme(ThemeData theme, {TextStyle? textStyle})
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
        textAlign = TextAlign.center,
        textStyle = textStyle ?? PSTextStyle.h4Bold(color: PSColors.white);

  PSPrimaryButtonStyle.outlineTheme(ThemeData theme, {TextStyle? textStyle})
      : borderRadius = BorderRadius.circular(10),
        padding = const EdgeInsets.all(0),
        disabledColor = PSColors.gray02,
        borderColor = PSColors.gray02,
        background = PSColors.white,
        height = 56,
        width = double.infinity,
        textAlign = TextAlign.center,
        shape = RoundedRectangleBorder(
          side: const BorderSide(color: PSColors.primaryColor),
          borderRadius: BorderRadius.circular(4.0),
        ),
        dotColor = PSColors.primaryColor,
        textStyle = textStyle ??
            const TextStyle(
                fontWeight: FontWeight.w500, color: PSColors.primaryColor);

  PSPrimaryButtonStyle.customSizeOutline(
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
        textAlign = TextAlign.center,
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
