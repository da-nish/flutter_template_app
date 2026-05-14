// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'text_button_style.dart';

export 'text_button_style.dart';

class PSTextButton extends StatelessWidget {
  final String title;
  final Widget? child;
  final Function? onTap;
  final bool isLoading;
  final bool visibility;
  final PSTextButtonStyle style;

  const PSTextButton(
      {super.key,
      this.title = "ButtonText",
      this.child,
      this.isLoading = false,
      this.onTap,
      this.visibility = true,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visibility,
      child: InkWell(
        onTap: () {
          if (!isLoading && onTap != null) {
            onTap?.call();
          }
        },
        child: isLoading
            ? const CircularProgressIndicator()
            : child ??
                Text(
                  title,
                  style: style.textStyle,
                ),
      ),
    );
  }
}
