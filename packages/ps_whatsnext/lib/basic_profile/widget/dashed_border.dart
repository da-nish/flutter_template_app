
import 'package:flutter/material.dart';

class DashedLeftBorder extends StatelessWidget {
  final Widget child;
  final Color color;
  final double width;
  final double dashHeight;
  final double gap;

  const DashedLeftBorder({
    super.key,
    required this.child,
    this.color = Colors.blue,
    this.width = 2,
    this.dashHeight = 6,
    this.gap = 4,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedLeftBorderPainter(
        color: color,
        width: width,
        dashHeight: dashHeight,
        gap: gap,
      ),
      child: child,
    );
  }
}

class _DashedLeftBorderPainter extends CustomPainter {
  final Color color;
  final double width;
  final double dashHeight;
  final double gap;

  _DashedLeftBorderPainter({
    required this.color,
    required this.width,
    required this.dashHeight,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = width;

    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
