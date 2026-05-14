import 'package:flutter/material.dart';
import 'package:ps_ui/extension/decoration.dart';
import 'package:ps_ui/widget/alert_container/alert_container_style.dart';
export 'alert_container_style.dart';

class PSAlertContainer extends StatelessWidget {
  final Widget child;
  final PSAlertContainerStyle style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const PSAlertContainer(
      {required this.child,
      required this.style,
      this.padding,
      this.margin,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: style.themeColor.withAlpha(14),
      ),
      child: Container(
        padding: style.padding,
        decoration: PSDottedDecoration(
          shape: PSShape.box,
          borderRadius: BorderRadius.circular(3),
          strokeWidth: 1,
          dash: const [4, 4],
          color: style.themeColor,
        ),
        width: double.infinity,
        child: child,
      ),
    );
  }
}
