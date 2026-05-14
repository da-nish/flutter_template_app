import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

class PSTextButtonStyle {
  final TextStyle textStyle;

  PSTextButtonStyle.defaultTheme(
    ThemeData theme,
  ) : textStyle = PSTextStyle.h5Regular(
            color: PSColors.primaryColor, decoration: TextDecoration.underline);
}
