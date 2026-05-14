import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/widget/toast/toast.dart';

class PSToastStyle {
  final int timeInSecond;
  final double? fontSize;
  final PSToastTime? toastLength;
  final PSToastGravity gravity;
  final Color? textColor;
  final Color? backgroundColor;

  PSToastStyle.defaultTheme(
    ThemeData theme, {
    this.timeInSecond = 2,
    this.fontSize = PSDimens.h4,
    this.toastLength = PSToastTime.LENGTH_LONG,
    this.gravity = PSToastGravity.BOTTOM,
    this.textColor = PSColors.black0,
  }) : backgroundColor = theme.scaffoldBackgroundColor;

  PSToastStyle.darkTheme(
    ThemeData theme, {
    this.timeInSecond = 2,
    this.fontSize = PSDimens.h4,
    this.toastLength = PSToastTime.LENGTH_LONG,
    this.gravity = PSToastGravity.BOTTOM,
    this.textColor = PSColors.white,
  }) : backgroundColor = PSColors.appbarColor;

  PSToastStyle.infoTheme(
    ThemeData theme, {
    this.timeInSecond = 2,
    this.fontSize = PSDimens.h6,
    this.toastLength = PSToastTime.LENGTH_LONG,
    this.gravity = PSToastGravity.BOTTOM,
    this.textColor = PSColors.black0,
  }) : backgroundColor = PSColors.liteBlueBackground;

  PSToastStyle.successTheme(
    ThemeData theme, {
    this.timeInSecond = 2,
    this.fontSize = PSDimens.h4,
    this.toastLength = PSToastTime.LENGTH_LONG,
    this.gravity = PSToastGravity.BOTTOM,
    this.textColor = PSColors.white,
  }) : backgroundColor = PSColors.activeGreen01; //theme.highlightColor;

  PSToastStyle.errorTheme(
    ThemeData theme, {
    this.timeInSecond = 2,
    this.fontSize = PSDimens.h4,
    this.toastLength = PSToastTime.LENGTH_LONG,
    this.gravity = PSToastGravity.BOTTOM,
    this.textColor = PSColors.white,
  }) : backgroundColor = theme.colorScheme.error;
}
