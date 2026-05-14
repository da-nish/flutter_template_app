import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';

class PSAlertContainerStyle {
  final double width;
  final BorderRadius? borderRadius;
  final Color themeColor;
  final EdgeInsets? padding;

  PSAlertContainerStyle.redTheme(ThemeData theme)
      : borderRadius = BorderRadius.circular(3),
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        themeColor = PSColors.red,
        width = double.infinity;

  PSAlertContainerStyle.greenTheme(ThemeData theme)
      : borderRadius = BorderRadius.circular(3),
        padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        themeColor = PSColors.successColor,
        width = double.infinity;
}
