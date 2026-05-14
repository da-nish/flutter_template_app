import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

class PSMarkButtonStyle {
  final Color backgroundColor;
  final Color iconColor;
  final OutlinedBorder borderShape;
  final BorderSide borderSide;
  final double buttonSize;
  final EdgeInsetsGeometry padding;

  PSMarkButtonStyle.circular(
    ThemeData theme, {
    this.iconColor = PSColors.primaryColor,
    this.buttonSize = 40,
    this.borderShape = const CircleBorder(),
    this.padding = const EdgeInsets.all(8),
    this.borderSide = const BorderSide(width: 1, color: PSColors.borderColor),
  }) : backgroundColor = PSColors.liteBlueBackground;

  PSMarkButtonStyle.retangular(
    ThemeData theme, {
    this.iconColor = PSColors.primaryColor,
    this.buttonSize = 40,
    this.padding = const EdgeInsets.all(8),
    this.borderSide = const BorderSide(width: 1, color: PSColors.borderColor),
  })  : backgroundColor = PSColors.liteBlueBackground,
        borderShape =
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
}
