import 'package:flutter/material.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_dimens.dart';
import 'package:ps_ui/widget/checkbox/checkbox_style.dart';

class PSCheckbox extends StatefulWidget {
  final PSCheckboxStyle style;
  final String text;
  final Function(bool) listener;
  final bool? checked;

  const PSCheckbox(
      {required this.text,
      required this.style,
      required this.checked,
      required this.listener,
      super.key});

  @override
  PSCheckboxState createState() => PSCheckboxState();
}

class PSCheckboxState extends State<PSCheckbox> {
  bool? checked;

  @override
  void initState() {
    checked = widget.checked;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PSCheckbox oldWidget) {
    if (widget.checked != oldWidget.checked) {
      setState(() {
        checked = widget.checked;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.listener.call(!checked!);
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            height: PSDimens.grid18,
            width: PSDimens.grid18,
            decoration: BoxDecoration(
                // color: widget.style.activeColor,
                border: Border.all(width: 1, color: PSColors.primaryColor),
                borderRadius: BorderRadius.circular(2)),
            child: checked!
                ? Center(
                    child: Icon(
                      Icons.check,
                      color: widget.style.markIconColor,
                      size: PSDimens.grid12,
                    ),
                  )
                : const SizedBox(
                    height: PSDimens.grid10,
                    width: PSDimens.grid10,
                  ),
          ),
          const SizedBox(
            width: PSDimens.grid10,
          ),
          Flexible(
            child: Text(
              widget.text,
              style: widget.style.textStyle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
