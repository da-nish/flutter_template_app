import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/theme/app_colors.dart';
import 'package:ps_ui/theme/app_text_style.dart';

// ignore: must_be_immutable
class PSParentExpansionTile extends StatefulWidget {
  final String tileName;
  final String? tileValue;
  final bool showIcon;
  final String? svgIconPath;
  final List<Widget> children;
  final double? contentPadding;
  final Function? onExpand;
  bool parentExpanded;
  PSParentExpansionTile(
      {super.key,
      required this.tileName,
      this.tileValue,
      this.showIcon = false,
      this.svgIconPath,
      this.children = const [],
      this.contentPadding = 10.0,
      this.onExpand,
      required this.parentExpanded});
  @override
  State<PSParentExpansionTile> createState() => _PSParentExpansionTileState();
}

class _PSParentExpansionTileState extends State<PSParentExpansionTile> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();

    if (widget.showIcon) {
      isExpanded = widget.parentExpanded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }

  Widget _buildList() {
    return Theme(
      key: widget.key,
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        contentPadding: EdgeInsets.zero,
        dense: true,
        horizontalTitleGap: 0.0,
        minLeadingWidth: 0,
        child: ExpansionTile(
          expandedAlignment: Alignment.centerLeft,
          initiallyExpanded: widget.parentExpanded,
          tilePadding: EdgeInsets.zero,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          controlAffinity: ListTileControlAffinity.leading,
          textColor: Colors.black,
          collapsedTextColor: Colors.black,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(widget.tileName,
                        style: PSTextStyle.h5SemiBold(color: Colors.black)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  widget.children.isEmpty ? "" : widget.tileValue ?? '',
                  style: PSTextStyle.h5SemiBold(
                      color: widget.children.isNotEmpty
                          ? Colors.black
                          : PSColors.primaryHintColor),
                ),
              ),
            ],
          ),
          leading: Padding(
            padding: const EdgeInsets.only(top: 0, right: 9, left: 14),
            child: SvgPicture.asset(
              isExpanded ? PSAssets.icMinus : PSAssets.icPlus,
              // colorFilter: widget.children.isNotEmpty
              //     ? null
              //     : PSColors.primaryHintColor.toColorFilter
            ),
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              widget.parentExpanded = expanded;
              isExpanded = expanded;
            });
            if (expanded && widget.onExpand != null) {
              widget.onExpand?.call();
            }
          },
          childrenPadding: const EdgeInsets.only(left: 40, right: 12),
          children: widget.children,
        ),
      ),
    );
  }
}
