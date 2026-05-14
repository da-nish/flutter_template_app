import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';

class PSDefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PSDefaultAppbar({
    super.key,
  });

  static const double leftPadding = 20;

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: Platform.isAndroid
          ? const SystemUiOverlayStyle(
              statusBarColor: PSColors.appbarColor,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              systemNavigationBarIconBrightness: Brightness.light)
          : null,
      elevation: 0,
      backgroundColor: PSColors.appbarColor,
      centerTitle: false,
      title: const SizedBox(), //MenuIcon(),
      titleSpacing: PSDimens.grid10,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: PSDimens.grid24),
          child: SizedBox(
              // padding: const EdgeInsets.symmetric(vertical: Dimens.grid10),
              width: width * 0.25,
              child: Image.asset(
                PSAssets.logoWhite,
                fit: BoxFit.fitWidth,
              )),
        )
      ],
    );
  }
}
