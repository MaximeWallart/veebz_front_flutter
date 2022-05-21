import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/widgets/profile_interests_widget.dart';
import 'package:veebz_front_flutter/widgets/profile_picture.dart';
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
        body: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
                    fit: BoxFit.cover)),
            height: 600.0,
          ),
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color(0xFF3C516A),
                      ],
                      stops: [
                        0.0,
                        0.6
                      ])),
              child: Center(
                  child: SafeArea(
                child: Column(children: [
                  const ProfileInterestsWidget(),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 2,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          begin: FractionalOffset.centerLeft,
                          end: FractionalOffset.centerRight,
                          colors: [
                            Color(0xFFA5C0EE),
                            Color(0xFFF5C4EC),
                          ],
                        )),
                      )),
                  const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "John John",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'ABeeZee',
                            color: Colors.white),
                      ))
                ]),
              )))
        ]));
  }
}
