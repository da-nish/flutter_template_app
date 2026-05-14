import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_fonts.dart';

TextTheme psThemeBuilder(BuildContext context,
    {String bodyFontFamily = PSFonts.primaryFont}) {
  // TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      Theme.of(context).textTheme.apply(fontFamily: bodyFontFamily);
  TextTheme displayTextTheme =
      Theme.of(context).textTheme.apply(fontFamily: bodyFontFamily);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
