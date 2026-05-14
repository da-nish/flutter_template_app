import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';

class PSIconButtonStyle {
  final Color backgroundColor;
  final Color iconColor;
  final OutlinedBorder? borderShape;
  final BorderSide borderSide;
  final double buttonSize;
  final EdgeInsetsGeometry padding;

  PSIconButtonStyle.circular(
    ThemeData theme, {
    this.backgroundColor = PSColors.white,
    this.buttonSize = 40,
    this.borderShape = const CircleBorder(),
    this.padding = const EdgeInsets.all(8),
    this.iconColor = PSColors.black0,
    this.borderSide = const BorderSide(width: 1, color: PSColors.borderColor),
  });

  PSIconButtonStyle.retangular(
    ThemeData theme, {
    this.backgroundColor = PSColors.white,
    this.buttonSize = 40,
    this.padding = const EdgeInsets.all(8),
    this.borderShape = const RoundedRectangleBorder(),
    this.iconColor = PSColors.black0,
    this.borderSide = const BorderSide(width: 1, color: PSColors.borderColor),
  });
  PSIconButtonStyle.noBorder(
    ThemeData theme, {
    this.backgroundColor = PSColors.white,
    this.buttonSize = 40,
    this.padding = const EdgeInsets.all(8),
    this.borderShape,
    this.iconColor = PSColors.black0,
    this.borderSide = const BorderSide(width: 0, color: Colors.transparent),
  });
}
