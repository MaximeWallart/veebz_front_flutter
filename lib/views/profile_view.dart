import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/widgets/post_widget.dart';
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
            height: 750.0,
          ),
          Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.transparent,
                        MyColors.BackgroundAppColor,
                      ],
                      stops: [
                        0.0,
                        0.7
                      ])),
              child: Center(
                  child: SafeArea(
                      child: SingleChildScrollView(
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
                            MyColors.AccountFirstColor,
                            MyColors.AccountSecondColor,
                          ],
                        )),
                      )),
                  const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "John John",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      )),
                  const PostWidget(),
                  const PostWidget(),
                  const PostWidget(),
                  const PostWidget(),
                  const PostWidget(),
                  const PostWidget(),
                ]),
              ))))
        ]));
  }
}
