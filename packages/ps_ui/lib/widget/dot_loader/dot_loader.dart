import 'package:flutter/material.dart';

class PSThreeDotLoader extends StatelessWidget {
  final Color color;
  const PSThreeDotLoader(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 80,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _AnimatedDot(
            width: 30,
            delay: const Duration(milliseconds: 1200),
            color: color,
          ),
          _AnimatedDot(
            width: 40,
            delay: const Duration(milliseconds: 800),
            color: color.withOpacity(.5),
          ),
          _AnimatedDot(
            width: 50,
            delay: const Duration(milliseconds: 500),
            color: color.withOpacity(.3),
          )
        ],
      ),
    );
  }
}

class _AnimatedDot extends StatefulWidget {
  const _AnimatedDot(
      {required this.width, required this.delay, required this.color});
  final double width;
  final Duration delay;
  final Color color;
  // final double top;
  @override
  State<_AnimatedDot> createState() => _AnimatedDotState();
}

class _AnimatedDotState extends State<_AnimatedDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isDisposed = false;
  bool isForward = true;

  bool isStarted = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn))
      ..addStatusListener((status) async {
//        print(status);
        if (status == AnimationStatus.completed) {
          // await  Future.delayed( otp_screen.delay);
          if (mounted) {
            setState(() {
              isForward = false;
            });

            _animationController.reverse();
          }
        } else if (status == AnimationStatus.dismissed) {
          await Future.delayed(const Duration(seconds: 1));
          if (mounted) {
            setState(() {
              isForward = true;
            });
            _animationController.forward();
          }
        }
      });

    start();
    super.initState();
  }

  start() async {
    if (mounted) {
      await Future.delayed(widget.delay);
      if (_isDisposed) return;
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print("Dot");
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return Positioned(
              left: isForward
                  ? (widget.width + ((80 - widget.width) * (_animation.value)))
                  : (-10 + ((widget.width + 10) * (1 - _animation.value))),
              // left: (otp_screen.width *(isForward? (_animation.value):(1-_animation.value)))+(isForward ? (100- otp_screen.width) : (0) ),
              child: CircleAvatar(
                backgroundColor: widget.color,
                maxRadius: 2.5,
              ));
        });
  }
}
