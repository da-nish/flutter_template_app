import 'package:flutter/material.dart';
import 'package:ps_ui/widget/icon_button/icon_button_style.dart';
export 'icon_button_style.dart';

class PSIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  final PSIconButtonStyle style;
  const PSIconButton(
      {this.onTap, required this.style, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: style.buttonSize,
      width: style.buttonSize,
      child: ElevatedButton(
        onPressed: () {
          if (onTap != null) {
            onTap?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          shape: style.borderShape,
          side: style.borderSide,
          padding: style.padding,
          backgroundColor: style.backgroundColor, // <-- Button color
          foregroundColor: Colors.white.withAlpha(10), // <-- Splash color
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        child: Icon(icon, size: style.buttonSize / 2, color: style.iconColor),
      ),
    );
  }
}
