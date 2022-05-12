import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/widgets/veebz_appbar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const VeebzAppBar(),
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Banner.png"),
                    fit: BoxFit.cover)),
            child: Center(
              child: Column(children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.air),
                )
              ]),
            )));
  }
}
