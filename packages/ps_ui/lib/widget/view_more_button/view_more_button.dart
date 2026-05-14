// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ps_ui/widget/text_button/text_button.dart';

class PSViewMoreButton extends StatelessWidget {
  final bool isLoading;
  final bool visibility;
  final Function onTap;
  final EdgeInsetsGeometry? padding;
  final PSTextButtonStyle theme;
  const PSViewMoreButton({
    super.key,
    required this.isLoading,
    required this.visibility,
    required this.onTap,
    required this.theme,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? const SizedBox(
                    height: 32,
                    width: 32,
                    child: CircularProgressIndicator(),
                  )
                : PSTextButton(
                    style: theme,
                    title: "View More",
                    visibility: visibility,
                    onTap: onTap,
                  ),
          ],
        ),
      ),
    );
  }
}
