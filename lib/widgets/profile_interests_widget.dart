import 'dart:math';

import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/models/interest.dart';
import 'package:veebz_front_flutter/router/hero_dialogue_route.dart';
import 'package:veebz_front_flutter/widgets/profile_picture.dart';
import 'package:veebz_front_flutter/views/veebz_single_view.dart';

class ProfileInterestsWidget extends StatefulWidget {
  const ProfileInterestsWidget({Key? key}) : super(key: key);

  @override
  State<ProfileInterestsWidget> createState() => _ProfileInterestsWidgetState();
}

class _ProfileInterestsWidgetState extends State<ProfileInterestsWidget> {
  bool transition = false;
  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.easeInOut;
  static const Interest folk = Interest(
      name: "Indie - Folk",
      imgLink:
          "https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      veebers: 225,
      affinity: 45,
      postsNmb: 50);
  static const Interest rock = Interest(
      name: "Rock",
      imgLink:
          "https://images.unsplash.com/photo-1565022472425-b6ae14b4b050?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=727&q=80",
      veebers: 845,
      affinity: 23,
      postsNmb: 426);

  static const Interest street = Interest(
      name: "Street",
      imgLink:
          "https://images.unsplash.com/photo-1483393458019-411bc6bd104e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
      veebers: 84,
      affinity: 10,
      postsNmb: 24);
  static const Interest piano = Interest(
      name: "Piano",
      imgLink:
          "https://images.unsplash.com/photo-1552422535-c45813c61732?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      veebers: 115,
      affinity: 35,
      postsNmb: 65);
  static const Interest live = Interest(
      name: "Live",
      imgLink:
          "https://images.unsplash.com/photo-1595199279841-5d400790d341?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      veebers: 379,
      affinity: 15,
      postsNmb: 62);
  static const Interest violin = Interest(
      name: "Violin",
      imgLink:
          "https://images.unsplash.com/photo-1586351012965-861624544334?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      veebers: 84,
      affinity: 18,
      postsNmb: 14);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Center(
          child: Stack(children: [
        AnimatedPositioned(
            duration: duration,
            top: transition ? 175 - 62 : 10,
            left: transition ? MediaQuery.of(context).size.width / 2 - 62 : 30,
            curve: curve,
            child: const InterestPicture(
              interest: folk,
              size: 60,
            )),
        AnimatedPositioned(
            duration: duration,
            top: transition ? 175 - 37 : 30,
            right:
                transition ? MediaQuery.of(context).size.width / 2 - 37 : 110,
            curve: curve,
            child: const InterestPicture(
              interest: rock,
              size: 35,
            )),
        AnimatedPositioned(
            duration: duration,
            top: transition ? 175 - 22 : 110,
            right: transition ? MediaQuery.of(context).size.width / 2 - 22 : 60,
            curve: curve,
            child: const InterestPicture(
              interest: street,
              size: 20,
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 47 : 60,
            right: transition ? MediaQuery.of(context).size.width / 2 - 47 : 30,
            curve: curve,
            child: const InterestPicture(
              interest: piano,
              size: 45,
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 27 : 40,
            left: transition ? MediaQuery.of(context).size.width / 2 - 27 : 145,
            curve: curve,
            child: const InterestPicture(
              interest: live,
              size: 25,
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 32 : 95,
            left: transition ? MediaQuery.of(context).size.width / 2 : 65,
            curve: curve,
            child: const InterestPicture(
              interest: violin,
              size: 30,
            )),
        GestureDetector(
            onTap: () {
              setState(() {
                transition = !transition;
              });
            },
            child: const ProfilePicture())
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
          return VeebzSingleView(interest: interest);
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
