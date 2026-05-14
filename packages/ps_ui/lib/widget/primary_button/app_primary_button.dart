import 'package:flutter/material.dart';
import 'package:ps_ui/widget/dot_loader/dot_loader.dart';
import 'package:ps_ui/widget/primary_button/app_primary_button_style.dart';
export 'app_primary_button_style.dart';

class PSPrimaryButton extends StatefulWidget {
  final PSPrimaryButtonStyle style;
  final bool isEnabled;
  final bool isLoading;
  final int maxTextLines;
  final String text;
  final VoidCallback? onTap;

  const PSPrimaryButton({
    required this.style,
    required this.text,
    this.isEnabled = true,
    this.onTap,
    this.isLoading = false,
    this.maxTextLines = 1,
    super.key,
  });

  @override
  State<PSPrimaryButton> createState() => _PSPrimaryButtonState();
}

class _PSPrimaryButtonState extends State<PSPrimaryButton> {
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
          disabledBackgroundColor: widget.style.disabledColor,
          padding: widget.style.padding,
          backgroundColor: widget.style.background,
          // disabledForegroundColor: Colors.amber,
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
    return Text(
      widget.text,
      style: widget.style.textStyle,
      maxLines: widget.maxTextLines,
      textAlign: widget.style.textAlign,
      overflow: TextOverflow.ellipsis,
    );
  }
}
