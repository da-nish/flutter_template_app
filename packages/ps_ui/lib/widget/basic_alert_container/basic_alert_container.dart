import 'package:flutter/material.dart';
import 'package:ps_ui/widget/basic_alert_container/basic_alert_container_style.dart';
export 'basic_alert_container_style.dart';

class PSBasicAlertContainer extends StatelessWidget {
  final Widget child;
  final PSBasicAlertContainerStyle style;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const PSBasicAlertContainer(
      {required this.child,
      required this.style,
      this.padding,
      this.margin,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: style.padding,
        margin: margin,
        width: double.infinity,
        decoration: BoxDecoration(
          color: style.themeColor,
          borderRadius: style.borderRadius,
        ),
        child: child);

    // return Container(
    //   padding: padding,
    //   margin: margin,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(3),
    //     color: style.themeColor.withAlpha(14),
    //   ),
    //   child: Container(
    //     padding: style.padding,
    //     decoration: DottedDecoration(
    //       shape: Shape.box,
    //       borderRadius: BorderRadius.circular(3),
    //       strokeWidth: 1,
    //       dash: const [4, 4],
    //       color: style.themeColor,
    //     ),
    //     width: double.infinity,
    //     child: child,
    //   ),
    // );
  }
}
