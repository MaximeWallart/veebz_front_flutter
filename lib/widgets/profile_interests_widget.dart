import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/router/hero_dialogue_route.dart';
import 'package:veebz_front_flutter/widgets/profile_picture.dart';
import 'package:veebz_front_flutter/widgets/veebz_single_view.dart';

class ProfileInterestsWidget extends StatefulWidget {
  const ProfileInterestsWidget({Key? key}) : super(key: key);

  @override
  State<ProfileInterestsWidget> createState() => _ProfileInterestsWidgetState();
}

class _ProfileInterestsWidgetState extends State<ProfileInterestsWidget> {
  bool transition = false;
  static const Duration duration = Duration(seconds: 1);
  static const Curve curve = Curves.easeInOut;

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
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 62,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(HeroDialogRoute(
                          builder: (context) => const Center(
                                child: VeebzSingleView(veeb: "Rock"),
                              ),
                          settings: const RouteSettings()));
                    },
                    child: CircleAvatar(
                        backgroundImage: Image.network(
                          "https://images.unsplash.com/photo-1460723237483-7a6dc9d0b212?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                          errorBuilder: (context, error, stackTrace) =>
                              const Text("c'est cassé"),
                        ).image,
                        radius: 60)))),
        AnimatedPositioned(
            duration: duration,
            top: transition ? 175 - 37 : 30,
            right:
                transition ? MediaQuery.of(context).size.width / 2 - 37 : 110,
            curve: curve,
            child: const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 37,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1565022472425-b6ae14b4b050?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=727&q=80"),
                  radius: 35,
                ))),
        AnimatedPositioned(
            duration: duration,
            top: transition ? 175 - 22 : 110,
            right: transition ? MediaQuery.of(context).size.width / 2 - 22 : 60,
            curve: curve,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1483393458019-411bc6bd104e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
                radius: 20,
              ),
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 47 : 60,
            right: transition ? MediaQuery.of(context).size.width / 2 - 47 : 30,
            curve: curve,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 47,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1552422535-c45813c61732?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"),
                radius: 45,
              ),
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 27 : 40,
            left: transition ? MediaQuery.of(context).size.width / 2 - 27 : 145,
            curve: curve,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 27,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1595199279841-5d400790d341?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                radius: 25,
              ),
            )),
        AnimatedPositioned(
            duration: duration,
            bottom: transition ? 175 - 32 : 95,
            left: transition ? MediaQuery.of(context).size.width / 2 : 65,
            curve: curve,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 32,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1586351012965-861624544334?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
                radius: 30,
              ),
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
