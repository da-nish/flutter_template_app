import 'package:flutter/material.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/theme/theme.dart';
import 'package:ps_ui/widget/gif_image/gif_image.dart';

enum PSPopupType { fail, success, other }

class PSCommonPopupNotifier extends StatelessWidget {
  final PSPopupType type;
  final String message;

  const PSCommonPopupNotifier(
      {super.key, required this.message, required this.type});

  String getImage(PSPopupType type) {
    switch (type) {
      case PSPopupType.success:
        return PSAssets.gifRightCircle;
      case PSPopupType.fail:
        return PSAssets.gifRightCircle; // TODO: add fail gif animation
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: PSDimens.grid80,
            height: PSDimens.grid80,
            child: PSGifImage(
              assetImage: AssetImage(getImage(type)),
            )),
        const SizedBox(height: PSDimens.grid24),
        Text(
          message,
          textAlign: TextAlign.center,
          style: PSTextStyle.h2SemiBold(color: PSColors.black0),
        ),
        const SizedBox(height: PSDimens.grid8),
      ],
    );
  }
}
