import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSCheckboxStyle {
  final Color markIconColor;
  final Color activeColor;
  final Color inactiveColor;
  final double iconSize;
  final Duration animationDuration;
  final TextStyle textStyle;

  PSCheckboxStyle.degaultTheme(ThemeData theme)
      : activeColor = PSColors.primaryColor,
        textStyle = PSTextStyle.h5Regular(),
        animationDuration = PSDimens.durationS,
        iconSize = PSDimens.grid40,
        markIconColor = PSColors.primaryColor,
        inactiveColor = PSColors.gray03;
}
