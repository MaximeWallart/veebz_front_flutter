import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProfilePicture extends StatefulWidget {
  const ProfilePicture({Key? key}) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://webgradients.com/public/webgradients_png/008%20Rainy%20Ashville.png"),
                        radius: 80));
              })),
      const Center(
          child: CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
        radius: 75,
      ))
    ]);
  }
}
