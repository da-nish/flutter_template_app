import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:ps_ui/theme/app_dimens.dart';

class PSGifImage extends StatefulWidget {
  final ImageProvider assetImage;
  final Widget? placeholder;
  final Duration? duration;
  final EdgeInsets? padding;
  const PSGifImage(
      {required this.assetImage,
      this.duration,
      this.placeholder,
      this.padding,
      super.key});

  @override
  State<PSGifImage> createState() => _GifState();
}

class _GifState extends State<PSGifImage> with SingleTickerProviderStateMixin {
  late final GifController controller;

  @override
  void initState() {
    controller = GifController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.all(PSDimens.paddingNull),
      child: Gif(
        controller: controller,
        duration: widget.duration ?? PSDimens.duration2s,
        autostart: Autostart.once,
        placeholder: (context) => widget.placeholder ?? const Offstage(),
        image: widget.assetImage,
      ),
    );
  }
}
