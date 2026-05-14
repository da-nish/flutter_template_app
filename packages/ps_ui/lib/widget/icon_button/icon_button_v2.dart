import 'package:flutter/material.dart';
import 'package:ps_ui/widget/icon_button/icon_button_style.dart';
export 'icon_button_style.dart';

class PSIconButtonV2 extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final PSIconButtonStyle style;
  const PSIconButtonV2(
      {this.onTap, required this.style, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      iconSize: style.buttonSize,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      onPressed: () {
        if (onTap != null) {
          onTap?.call();
        }
      },
      color: style.iconColor,
      // iconSize: 20,
      constraints: const BoxConstraints(),
      padding: style.padding,
    );
  }
}
