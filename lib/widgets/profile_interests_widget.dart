import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/data/interests.dart';
import 'package:veebz_front_flutter/models/interest.dart';
import 'package:veebz_front_flutter/widgets/profile_picture_widget.dart';
import 'package:veebz_front_flutter/widgets/pop-ups/interest_widget.dart';

class ProfileInterestsWidget extends StatefulWidget {
  const ProfileInterestsWidget({Key? key}) : super(key: key);

  @override
  State<ProfileInterestsWidget> createState() => _ProfileInterestsWidgetState();
}

class _ProfileInterestsWidgetState extends State<ProfileInterestsWidget> {
  bool transition = false;
  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.easeInOut;
  List<Map<String, double>> sides = [];
  List<Map<String, double>> corners = [];

  void initPositions(BuildContext context) {
    sides = [];
    corners = [];
    corners.add({
      "x": MediaQuery.of(context).size.width * 0.05,
      "y": MediaQuery.of(context).size.height * 0.02
    });
    corners.add({
      "x": MediaQuery.of(context).size.width * 0.7,
      "y": MediaQuery.of(context).size.height * 0.26
    });
    corners.add({
      "x": MediaQuery.of(context).size.width * 0.05,
      "y": MediaQuery.of(context).size.height * 0.26
    });
    corners.add({
      "x": MediaQuery.of(context).size.width * 0.7,
      "y": MediaQuery.of(context).size.height * 0.02
    });
    sides.add({
      "x": MediaQuery.of(context).size.width * 0.05,
      "y": MediaQuery.of(context).size.height * 0.16
    });
    sides.add({
      "x": MediaQuery.of(context).size.width * 0.4,
      "y": MediaQuery.of(context).size.height * 0.02
    });
    sides.add({
      "x": MediaQuery.of(context).size.width * 0.4,
      "y": MediaQuery.of(context).size.height * 0.26
    });
    sides.add({
      "x": MediaQuery.of(context).size.width * 0.7,
      "y": MediaQuery.of(context).size.height * 0.15
    });
  }

  Map<String, double> asignPosition(double size) {
    Map<String, double> res;
    print(corners.length);
    if (size < 40 && corners.isEmpty) {
      res = sides.first;
      sides.remove(sides.first);
      return res;
    } else {
      res = corners.first;
      corners.remove(corners.first);
      return res;
    }
  }

  Widget createInterestPicture(
      BuildContext context, Interest interest, double size) {
    double parentHeight = MediaQuery.of(context).size.width * 0.9;
    print("---------------------${interest.name}");
    final Map<String, double> coordinates = asignPosition(size);
    print(coordinates);
    return AnimatedPositioned(
        duration: duration,
        top: transition ? ((parentHeight / 2)) - (size + 2) : coordinates["y"],
        left: transition
            ? MediaQuery.of(context).size.width / 2 - (size + 2)
            : coordinates["x"],
        curve: curve,
        child: InterestPicture(
          interest: interest,
          size: size,
        ));
  }

  @override
  Widget build(BuildContext context) {
    initPositions(context);

    return SizedBox(
      height: MediaQuery.of(context).size.width * 0.9,
      child: Center(
          child: Stack(children: [
        createInterestPicture(context, Interests.folk, 60),
        createInterestPicture(context, Interests.piano, 45),
        createInterestPicture(context, Interests.rock, 35),
        createInterestPicture(context, Interests.violin, 30),
        createInterestPicture(context, Interests.live, 25),
        createInterestPicture(context, Interests.street, 20),
        GestureDetector(
            onTap: () {
              setState(() {
                sides = [];
                transition = !transition;
              });
            },
            child: const ProfilePictureWidget())
      ])),
    );
  }
}

class InterestPicture extends StatelessWidget {
  const InterestPicture({Key? key, required this.size, required this.interest})
      : super(key: key);

  final double size;
  final Interest interest;

  void showAlertDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: InterestWidget(interest: interest));
        });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: size + 2,
        child: GestureDetector(
            onTap: () {
              showAlertDialogue(context);
            },
            child: CircleAvatar(
                backgroundImage: Image.network(
                  interest.imgLink,
                  errorBuilder: (context, error, stackTrace) =>
                      const Text("c'est cassé"),
                ).image,
                radius: size)));
  }
}
