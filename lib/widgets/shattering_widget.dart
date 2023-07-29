import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';

class ShatteringWidget extends StatefulWidget {
  final Widget Function(void Function() shatter) builder;
  final void Function() onShatterCompleted;

  const ShatteringWidget(
      {super.key, required this.builder, required this.onShatterCompleted});

  @override
  State<ShatteringWidget> createState() => _ShatteringWidgetState();
}

class Shard {}

class _ShatteringWidgetState extends State<ShatteringWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late ui.Image image;
  GlobalKey key = GlobalKey();
  List<Shard> shards = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          controller.reset();
          widget.onShatterCompleted();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return controller.isAnimating
        ? CustomPaint(
            size: Size(image.width.toDouble(), image.height.toDouble()),
            painter: ShatteringWidgetPainter(image, shards, controller.value),
          )
        : RepaintBoundary(key: key, child: widget.builder(shatter));
  }

  void shatter() {
    RenderRepaintBoundary? boundary =
        key.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    ;

    boundary!.toImage().then((value) {
      this.image = value;
      controller.forward();
    });
  }
}

class ShatteringWidgetPainter extends CustomPainter {
  final ui.Image image;
  final List<Shard> shards;
  final double shatterProgress;

  ShatteringWidgetPainter(this.image, this.shards, this.shatterProgress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint imagePainter = Paint()
      ..shader = ImageShader(
          image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Rect r = Rect.fromLTWH(
        50 * shatterProgress, 50 * shatterProgress, size.width, size.height);
    canvas.drawRect(r, imagePainter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
