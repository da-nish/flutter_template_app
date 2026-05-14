import 'package:flutter/material.dart';
import 'package:ps_ui/ps_ui.dart';

class PSCommonConfirmPopup extends StatelessWidget {
  final String title;
  final String description;
  final Function? onTapConfirm;
  final Function? onTapCancel;
  final ThemeData theme;
  const PSCommonConfirmPopup(
      {required this.title,
      required this.description,
      required this.theme,
      this.onTapCancel,
      this.onTapConfirm,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: PSTextStyle.h3SemiBold(color: PSColors.black0),
        ),
        const SizedBox(height: PSDimens.grid12),
        Text(
          description,
          style: PSTextStyle.h5Regular(color: PSColors.black1),
        ),
        const SizedBox(height: PSDimens.grid24),
        Row(
          children: [
            Expanded(
              child: PSPrimaryButton(
                style: PSPrimaryButtonStyle.outlineTheme(theme),
                text: "Cancel",
                onTap: () {
                  onTapCancel?.call();
                },
              ),
            ),
            const SizedBox(width: PSDimens.grid12),
            Expanded(
              child: PSPrimaryButton(
                style: PSPrimaryButtonStyle.defaultTheme(theme),
                text: "Confirm",
                // isLoading: controller.isLoading,
                onTap: () async {
                  onTapConfirm?.call();
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
