import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';

class PSBasicAlertContainerStyle {
  final double width;
  final BorderRadius? borderRadius;
  final Color themeColor;
  final EdgeInsets? padding;

  PSBasicAlertContainerStyle.redTheme(ThemeData theme)
      : borderRadius = BorderRadius.circular(4),
        padding = const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        themeColor = PSColors.red,
        width = double.infinity;

  PSBasicAlertContainerStyle.greenTheme(ThemeData theme)
      : borderRadius = BorderRadius.circular(4),
        padding = const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        themeColor = PSColors.successColor,
        width = double.infinity;

  PSBasicAlertContainerStyle.yellowTheme(ThemeData theme, {EdgeInsets? padding})
      : borderRadius = BorderRadius.circular(4),
        padding =
            padding ?? const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        themeColor = PSColors.yellowLite,
        width = double.infinity;
}
