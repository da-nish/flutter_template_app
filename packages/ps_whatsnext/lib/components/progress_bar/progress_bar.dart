
import 'package:flutter/material.dart';

class HorizontalProgressBar extends StatelessWidget {
  final double percentage;
  final double height;
  final Color progressColor;
  final Color backgroundColor;
  final BorderRadius? borderRadius;

  const HorizontalProgressBar({
    super.key,
    required this.percentage,
    this.height = 8,
    this.progressColor = Colors.green,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final targetValue = percentage.clamp(0, 100) / 100;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          child: Stack(
            children: [
              Container(
                height: height,
                width: double.infinity,
                color: backgroundColor,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: targetValue),
                duration: const Duration(milliseconds: 2000),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Container(
                    height: height,
                    width: constraints.maxWidth * value,
                    color: progressColor,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}