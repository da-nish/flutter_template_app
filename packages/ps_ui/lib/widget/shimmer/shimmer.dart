import 'package:flutter/material.dart';
import 'package:ps_ui/ps_ui.dart';
import 'package:shimmer/shimmer.dart';

class PSShimmer extends StatelessWidget {
  final Widget child;

  const PSShimmer({required this.child, super.key});

  static PSShimmer basicShimmer(
      {double? height, double? width, double radius = 0}) {
    return PSShimmer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: PSColors.shimmerColor,
      highlightColor: PSColors.borderColor,
      child: AbsorbPointer(
        absorbing: true,
        child: child,
      ),
    );
  }
}
