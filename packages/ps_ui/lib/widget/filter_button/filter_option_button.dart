import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ps_ui/constant/app_assets.dart';
import 'package:ps_ui/extension/color.dart';
import 'package:ps_ui/theme/app_colors.dart';

class PSFilterOptionButton extends StatelessWidget {
  const PSFilterOptionButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.isEnabled = true,
    this.showArrowIcon = false,
    this.onClick,
  });
// FilterOptionModel buttonItem

  final String title;
  final bool isSelected;
  final bool showArrowIcon;
  final bool isEnabled;
  final Function? onClick;

  Color getColor(bool isSelected) {
    return isSelected
        ? PSColors.activeBlue01
        : PSColors.filterRadioUnselectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onClick != null && isEnabled) {
          onClick!();
        }
      },
      child: Container(
        // duration: Dimens.duration1s,
        padding: const EdgeInsets.only(top: 7, bottom: 9, right: 10, left: 10),
        decoration: BoxDecoration(
            color: isEnabled == false
                ? PSColors.gray01
                : isSelected
                    ? PSColors.optionChecked
                    : PSColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 3),
                  color: PSColors.filterItemShadowColor)
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (isSelected) ...[
              Icon(
                Icons.check,
                color: getColor(isSelected),
                size: 15,
              ),
              const SizedBox(
                width: 8,
              ),
            ],
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  color: getColor(isSelected),
                ),
              ),
            ),
            if (showArrowIcon) ...[
              SvgPicture.asset(
                PSAssets.icArrowDown,
                colorFilter: getColor(isSelected).toColorFilter,
                height: 16,
                width: 20,
                // size: 15,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
