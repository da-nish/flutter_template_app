import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_fonts.dart';
import 'package:ps_ui/theme/theme.dart';

mixin PSTextStyle {
  static const String defaultfontFamily = PSFonts.primaryFont;
//bold
  static TextStyle boldSize({
    Color? color,
    FontStyle fontStyle = FontStyle.normal,
    FontWeight fontWeight = FontWeight.bold,
    double fontSize = 28,
  }) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);
  static TextStyle h1Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h1,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h2Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h2,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h25Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w700}) =>
      TextStyle(
          fontSize: 20,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h26Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w700}) =>
      TextStyle(
          fontSize: 26,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h3Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          double fontSize = PSDimens.h3,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h4Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h4,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h5Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600,
          double fontSize = PSDimens.h5}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h6Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h6,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h65Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h7,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h7Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h7,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h8Bold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.bold}) =>
      TextStyle(
          fontSize: PSDimens.h8,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  // semi bold

  static TextStyle h1SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h1,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h2SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h2,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h25SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: 20,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h26SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: 26,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h3SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          double fontSize = PSDimens.h3,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h4SemiBold(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h4,
          fontWeight: FontWeight.w600,
          color: color,
          fontFamily: defaultfontFamily,
          fontStyle: fontStyle);

  static TextStyle h5SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600,
          double fontSize = PSDimens.h5}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: defaultfontFamily,
          fontStyle: fontStyle);

  static TextStyle h6SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h6,
          fontWeight: fontWeight,
          color: color,
          fontFamily: defaultfontFamily,
          fontStyle: fontStyle);

  static TextStyle h7SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h7,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h8SemiBold(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w600}) =>
      TextStyle(
          fontSize: PSDimens.h8,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

//medium
  static TextStyle h1Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h1,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h2Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h2,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle);
  static TextStyle h25Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h3Medium(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w500}) =>
      TextStyle(
          fontSize: PSDimens.h3,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h4Medium(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w500,
          double fontSize = PSDimens.h4}) =>
      TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h45Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h5Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h5,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h6Medium(
          {Color? color,
          FontStyle fontStyle = FontStyle.normal,
          FontWeight fontWeight = FontWeight.w500}) =>
      TextStyle(
          fontSize: PSDimens.h6,
          fontWeight: fontWeight,
          color: color,
          fontFamily: defaultfontFamily,
          fontStyle: fontStyle);

  static TextStyle h7Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h7,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h8Medium(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h8,
          fontWeight: FontWeight.w500,
          color: color,
          fontStyle: fontStyle);

  //regular
  static TextStyle h1Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h1,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h2Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h2,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h3Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h3,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h4Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h4,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h45Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h5Regular({
    Color? color,
    FontStyle fontStyle = FontStyle.normal,
    fontWeight = FontWeight.w400,
    decoration = TextDecoration.none,
  }) =>
      TextStyle(
          fontSize: PSDimens.h5,
          fontWeight: fontWeight,
          color: color,
          decoration: decoration,
          fontStyle: fontStyle);

  static TextStyle h6Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h6,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h7Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h7,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);

  static TextStyle h8Regular(
          {Color? color, FontStyle fontStyle = FontStyle.normal}) =>
      TextStyle(
          fontSize: PSDimens.h8,
          fontWeight: FontWeight.w400,
          color: color,
          fontStyle: fontStyle);
}
