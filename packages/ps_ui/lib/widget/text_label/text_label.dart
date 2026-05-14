import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSTextLabel extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color textColor;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  // Constructor to pass the text and background color
  const PSTextLabel({
    super.key,
    required this.text,
    this.backgroundColor = PSColors.gray01, // Default background color
    this.textColor = Colors.white, // Default text color
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(
        horizontal: PSDimens.grid12,
        vertical: PSDimens.grid2), // Default padding
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      child: Text(
        text,
        style: textStyle ?? PSTextStyle.h6SemiBold(color: PSColors.white),
      ),
    );
  }
}
