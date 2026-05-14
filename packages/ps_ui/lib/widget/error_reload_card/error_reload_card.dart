import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_text_style.dart';

class PSErrorCard extends StatelessWidget {
  const PSErrorCard(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.onTap,
      this.errorText = "",
      this.tag,
      this.disableReloadButton = false,
      this.showRetryButtonOnly = false,
      this.showBoxShadow = false,
      this.hideDecorations = true,
      this.retryBtnText = "Retry"});
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final String errorText;
  final String? tag;
  final bool disableReloadButton;
  final bool showBoxShadow;
  final bool hideDecorations;
  final String retryBtnText;
  final bool showRetryButtonOnly;
  @override
  Widget build(BuildContext context) {
    if (showRetryButtonOnly) {
      return _retry();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        width: width ?? screenWidth,
        height: height ?? screenHeight * .35,
        decoration: BoxDecoration(
            color: Colors.transparent,
            // borderRadius: BorderRadius.circular(5),
            // border: Border.all(width: 1, color: PSColors.primaryColor),
            boxShadow: showBoxShadow
                ? [
                    const BoxShadow(
                        color: PSColors.errorCardShadow,
                        offset: Offset(0, 4),
                        blurRadius: 8)
                  ]
                : null),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (errorText.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  errorText,
                  textAlign: TextAlign.center,
                ),
              ),
            _retry()
          ],
        ),
      ),
    );
  }

  Widget _retry() {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.replay_sharp,
            size: 12,
            color: PSColors.primaryColor,
          ),
          Text(
            retryBtnText,
            style: PSTextStyle.h5Regular(color: PSColors.primaryColor),
          )
        ],
      ),
    );
  }
}
