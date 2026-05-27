import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

mixin PSCommonStyle {
  static TextStyle bottomsheetTextTitleStyle =
      PSTextStyle.h3SemiBold(color: PSColors.black0);

  static Decoration containerShadowDecorationV1 = BoxDecoration(
    border: Border.all(
      width: PSDimens.commonBorderWidth,
      color: PSColors.borderColor01,
    ),
    color: PSColors.white,
    borderRadius: BorderRadius.circular(PSDimens.grid4),
    boxShadow: [
      BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: 8,
          color: PSColors.black2.withValues(alpha: .12)),
    ],
  );

  static Decoration containerShadowDecorationV2 = BoxDecoration(
    border: Border.all(
      width: PSDimens.commonBorderWidth,
      color: PSColors.cardBorder,
    ),
    color: PSColors.white,
    borderRadius: BorderRadius.circular(PSDimens.grid4),
    boxShadow: [
      BoxShadow(
          offset: const Offset(0, 4),
          blurRadius: PSDimens.grid8,
          color: PSColors.boxShadowColor.withValues(alpha: .15)),
    ],
  );

  // static BorderRadius pointedBorderRadius({double radius = 48}) {
  //   return BorderRadius.only(
  //     topRight: Radius.circular(radius),
  //     bottomLeft: Radius.circular(radius),
  //     topLeft: Radius.circular(radius),
  //     bottomRight: const Radius.circular(4),
  //   );
  // }

  // static BorderRadius circularBorder({double radius = 48}) {
  //   return BorderRadius.circular(radius);
  // }

  // /// Radius

  // static const BorderRadius borderRadius = BorderRadius.only(
  //   topLeft: Radius.circular(23.0),
  //   topRight: Radius.circular(23.0),
  //   bottomLeft: Radius.circular(23.0),
  //   bottomRight: Radius.circular(0),
  // );
  // static const BorderRadius radiusS = BorderRadius.all(Radius.circular(4));
  // static const BorderRadius radiusTrailingS = BorderRadius.only(
  //     topRight: Radius.circular(4), bottomRight: Radius.circular(4));
  // static const BorderRadius radiusML = BorderRadius.all(Radius.circular(24));
}
