import 'package:flutter/material.dart';

class WiggleWidget extends StatefulWidget {
  const WiggleWidget({
    Key? key,
    this.duration = const Duration(seconds: 1),
    this.deltaY = 20,
    this.deltaX = 20,
    this.curve = Curves.easeInOutBack,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaY;
  final double deltaX;
  final Widget child;
  final Curve curve;

  @override
  _WiggleWidgetState createState() => _WiggleWidgetState();
}

class _WiggleWidgetState extends State<WiggleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double wiggle(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(widget.deltaX * wiggle(controller.value),
            widget.deltaY * wiggle(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}
