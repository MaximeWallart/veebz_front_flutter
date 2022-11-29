import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../data/users.dart';

class ProfilePictureWidget extends StatefulWidget {
  const ProfilePictureWidget({Key? key}) : super(key: key);

  @override
  State<ProfilePictureWidget> createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat();

  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double taille = MediaQuery.of(context).size.width / 5;

    return Stack(children: [
      Center(
          child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: CircleAvatar(
                        // child: Container(
                        //   decoration: const BoxDecoration(
                        //       gradient: LinearGradient(
                        //     begin: FractionalOffset.centerLeft,
                        //     end: FractionalOffset.centerRight,
                        //     colors: [
                        //       MyColors.AccountFirstColor,
                        //       MyColors.AccountSecondColor,
                        //     ],
                        //   )),
                        // ),
                        backgroundImage: const NetworkImage(
                            "https://webgradients.com/public/webgradients_png/008%20Rainy%20Ashville.png"),
                        radius: taille + 3));
              })),
      Center(
          child: CircleAvatar(
        backgroundImage: NetworkImage(Users.john.profilePicLink),
        radius: taille,
      ))
    ]);
  }
}
