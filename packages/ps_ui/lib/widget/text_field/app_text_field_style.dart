import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

class PSTextFieldStyle {
  final double width;
  final double height;
  final Color? borderColor;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;
  final Color background;
  final Color cursorColor;
  final Color errorColor;
  final Color disabledBackground;
  final EdgeInsets? padding;
  final Color dotColor;

  PSTextFieldStyle.defaultTheme(ThemeData theme)
      : borderRadius = BorderRadius.circular(10),
        padding = const EdgeInsets.all(0),
        cursorColor = PSColors.primaryColor,
        disabledBackground = PSColors.disabledBackground,
        borderColor = PSColors.gray03,
        background = PSColors.white,
        height = 56,
        errorColor = PSColors.errorColor,
        width = double.infinity,
        dotColor = PSColors.white,
        textAlign = TextAlign.center,
        textStyle = PSTextStyle.h4Bold(color: PSColors.white);
}
