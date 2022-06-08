import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:veebz_front_flutter/models/post.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/views/create_post_view.dart';
import 'package:veebz_front_flutter/widgets/post_widget.dart';
import 'package:veebz_front_flutter/widgets/profile_interests_widget.dart';
import 'package:veebz_front_flutter/widgets/veebz_appbar.dart';

import '../models/user.dart';
import '../router/hero_dialogue_route.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<PostWidget> postWidgetList = [];

  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

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
  User jean = User(
      pseudo: "Jean...juste Jean",
      address: "JeanLaD",
      profilePicLink:
          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80");

  @override
  void initState() {
    super.initState();
    List<Post> postsList = [
      Post(
          message:
              "Écoutez moi cette petite dingz que viens de sortir mon pote Tyler ✨✨",
          user: john),
      Post(
          message:
              "Ça fait trop longtemps que je suis pas allé à un concert ça me manque troooop !!!",
          user: pierre),
      Post(message: "Pas fou le dernier son de John John hein", user: jean)
    ];
    for (var element in postsList) {
      postWidgetList
          .add(PostWidget(post: element, delete: () => deletePost(element)));
    }
  }

  void deletePost(post) {
    setState(() {
      postWidgetList.removeWhere((element) => element.post == post);
    });
  }

  void addPost(post) {
    setState(() {
      postWidgetList
          .add(PostWidget(post: post, delete: () => deletePost(post)));
    });
  }

  void addGenericPost() {
    Post post = Post(user: john, message: "test test");
    addPost(post);
  }

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
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      john.pseudo,
                      style: const TextStyle(fontSize: 50, color: Colors.white),
                    )),
                ...postWidgetList
              ]),
            ))))
      ]),
      floatingActionButton: SpeedDial(
        openCloseDial: isDialOpen,
        backgroundColor: const Color(0xFF6432A6),
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        animationCurve: Curves.elasticInOut,
        spaceBetweenChildren: 4,
        spacing: 3,
        renderOverlay: false,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            onTap: () => addGenericPost(),
            backgroundColor: const Color(0xFF9061DC),
          ),
          SpeedDialChild(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: const Color(0xFF9061DC),
              onTap: () {
                Navigator.of(context).push(HeroDialogueRouteBuilder(
                    builder: (context) => const Center(child: CreatePostView()),
                    settings: const RouteSettings()));
              })
        ],
      ),
    );
  }
}
