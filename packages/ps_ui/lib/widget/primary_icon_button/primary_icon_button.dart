import 'package:flutter/material.dart';
import 'package:ps_ui/widget/dot_loader/dot_loader.dart';
import 'package:ps_ui/widget/primary_icon_button/primary_icon_button_style.dart';
export 'primary_icon_button_style.dart';

class PSPrimaryIconButton extends StatefulWidget {
  final PSPrimaryIconButtonStyle style;
  final bool isEnabled;
  final Widget? icon;
  final bool isLoading;
  final int maxTextLines;
  final String text;
  final VoidCallback? onTap;

  const PSPrimaryIconButton({
    required this.style,
    required this.text,
    this.isEnabled = true,
    this.onTap,
    this.isLoading = false,
    this.icon,
    this.maxTextLines = 1,
    super.key,
  });

  @override
  State<PSPrimaryIconButton> createState() => _PSPrimaryIconButtonState();
}

class _PSPrimaryIconButtonState extends State<PSPrimaryIconButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.style.width,
      height: widget.style.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: widget.style.shape,
          padding: widget.style.padding,
          backgroundColor: widget.style.background,
          //    Color backgroundColor, // set the background color
          //    Color foregroundColor,
          //    Color disabledForegroundColor,
          //    Color shadowColor,
          //    double elevation,
          //    TextStyle textStyle,
          //    EdgeInsetsGeometry padding,
          //    Size minimumSize,
          //    BorderSide side,
          //    OutlinedBorder shape,
          //    MouseCursor enabledMouseCursor,
          //    MouseCursor disabledMouseCursor,
          //    VisualDensity visualDensity,
          //    MaterialTapTargetSize tapTargetSize,
          //    Duration animationDuration,
          //    bool enableFeedback
          // backgroundColor: widget.style.background,
        ),
        onPressed: !widget.isEnabled
            ? null
            : () {
                if (widget.isEnabled &&
                    !widget.isLoading &&
                    widget.onTap != null) {
                  widget.onTap!();
                }
              },
        child:
            widget.isLoading ? PSThreeDotLoader(widget.style.dotColor) : _text,
      ),
    );
  }

  Widget get _text {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.icon != null) widget.icon ?? const SizedBox.shrink(),
        Text(
          widget.text,
          style: widget.style.textStyle,
          maxLines: widget.maxTextLines,
          textAlign: widget.style.textAlign,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
