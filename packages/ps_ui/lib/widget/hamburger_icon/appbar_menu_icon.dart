import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class PSHamburgerAnimation extends StatefulWidget {
  final Function toggleMenu;
  final bool Function() isOpenMenu;
  final Stream<bool> menuStream;
  const PSHamburgerAnimation({
    super.key,
    required this.isOpenMenu,
    required this.toggleMenu,
    required this.menuStream,
  });
  // final bool defaultCloseAnimation;
  @override
  PSHamburgerAnimationState createState() => PSHamburgerAnimationState();
}

class PSHamburgerAnimationState extends State<PSHamburgerAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );
  late final Animation<double> _firstBarAnimation =
      Tween<double>(begin: 1.0, end: 0.0).animate(
    _animationController,
  );
  StreamSubscription<bool>? stream;
  // AppDashboardController? appDashboardController;

  @override
  void initState() {
    // appDashboardController = Get.find<AppDashboardController>();
    stream = widget.menuStream.listen((event) {
      if (event) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    stream?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    if (widget.isOpenMenu()) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void onTapMenu() {
    if (_animationController.isAnimating) {
      return;
    }
    _toggleMenu();
    widget.toggleMenu();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: onTapMenu,
      child: AnimatedBuilder(
        animation: _firstBarAnimation,
        builder: (BuildContext context, Widget? child) {
          double angle =
              max(.01, (45 * _animationController.value) * (pi / 180));
          double space = 3 * _animationController.value;
          return SizedBox(
            // color: Colors.amber,
            width: 48.0,
            height: 48.0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 21 + space,
                  child: Transform.rotate(
                      alignment: Alignment.center,
                      angle: angle,
                      child: Container(
                        width: 20.0,
                        height: 2.0,
                        color: Colors.white,
                      )),
                ),
                Positioned(
                  // left: DefaultAppBar.leftPadding,
                  top: 27 - space,
                  child: Transform.rotate(
                    alignment: Alignment.center,
                    angle: -angle,
                    child: Container(
                      width: 20.0,
                      height: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
