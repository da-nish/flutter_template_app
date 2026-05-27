import 'dart:io' as os;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/extension/color.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSFilterButton extends StatelessWidget {
  final String title;
  final String logo;
  final VoidCallback onTap;
  final bool showIndicator;

  const PSFilterButton(
      {super.key,
      required this.title,
      this.logo = PSAssets.icFilter,
      required this.onTap,
      this.showIndicator = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          margin: EdgeInsets.only(bottom: os.Platform.isIOS ? 0 : 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: PSColors.filterBorder),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: PSColors.primaryColor.withValues(alpha: .15))
              ]),
          child: InkWell(
            onTap: () {
              onTap();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: PSDimens.grid16, vertical: PSDimens.grid8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 13,
                        height: 13,
                        child: SvgPicture.asset(
                          logo,
                          colorFilter: PSColors.filterIconColor.toColorFilter,
                        ),
                      ),
                      if (showIndicator)
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 5,
                            height: 5,
                            alignment: Alignment.topRight,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        )
                    ],
                  ),
                  const SizedBox(width: PSDimens.grid4),
                  Text(
                    title,
                    style:
                        PSTextStyle.h6Regular(color: PSColors.filterIconColor),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
