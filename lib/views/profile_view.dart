import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/widgets/post_widget.dart';
import 'package:veebz_front_flutter/widgets/profile_interests_widget.dart';
import 'package:veebz_front_flutter/widgets/veebz_appbar.dart';

import '../models/user.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late List<PostWidget> postsList;

  User john = User(
      pseudo: "John John",
      address: "XxJohnJohnDu59xX",
      profilePicLink:
          "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80");

  User pierre = User(
      pseudo: "Pierrrrrrrrrre",
      address: "TahLeπR",
      profilePicLink:
          "https://images.unsplash.com/photo-1551847812-f815b31ae67c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464");
  @override
  Widget build(BuildContext context) {
    void deletePost(post) {
      print(postsList);
      print("allez bisous hein");
      setState(() {
        postsList.removeWhere((element) => element.key == post);
      });
      print(postsList);
    }

    postsList = [
      PostWidget(
          user: john,
          message:
              "Écoutez moi cette petite dingz que viens de sortir mon pote Tyler ✨✨",
          delete: () => {deletePost(widget.key)}),
      PostWidget(
          user: pierre,
          message:
              "Ça fait trop longtemps que je suis pas allé à un concert ça me manque troooop !!!",
          delete: () => {}),
    ];

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
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        john.pseudo,
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      )),
                  ...postsList
                ]),
              ))))
        ]));
  }
}
