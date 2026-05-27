import 'package:flutter/material.dart';
import 'package:ps_ui/theme/theme.dart';

class PSRadioButton extends StatelessWidget {
  const PSRadioButton(
      {super.key,
      this.size = 15,
      this.title = "",
      this.isSelected = false,
      this.onChanged});
  final double size;
  final bool isSelected;
  final String title;
  final Function()? onChanged;

  static const Color color = PSColors.optionTextChecked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onChanged != null) {
          onChanged!();
        }
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? color : color.withValues(alpha: 0.3),
                ),
              ),
              Container(
                width: size - 3,
                height: size - 3,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? color : color.withValues(alpha: .3),
                ),
              ),
            ],
          ),
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                title,
                style: isSelected
                    ? PSTextStyle.h5SemiBold(color: PSColors.gray04)
                    : PSTextStyle.h5Regular(color: PSColors.gray03),
              ),
            )
        ],
      ),
    );
  }
}
