import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_stack/image_stack.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/widgets/pop-ups/post_creation_widget.dart';
import 'package:veebz_front_flutter/widgets/post_widget.dart';
import 'package:veebz_front_flutter/widgets/profile_interests_widget.dart';
import 'package:veebz_front_flutter/widgets/veebz_appbar.dart';

import '../data/posts.dart';
import '../data/users.dart';
import '../models/post.dart';
import '../models/user.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  void deletePost(post) {
    setState(() {
      Posts.deletePost(post);
    });
  }

  void addPost(post) {
    setState(() {
      Posts.addPost(post, () => deletePost(post));
    });
  }

  void addGenericPost() {
    setState(() {
      Post post = Post(user: widget.user, message: "test test");
      addPost(post);
    });
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
                    child: RefreshIndicator(
              onRefresh: () async {
                return Future<void>.delayed(const Duration(seconds: 3));
              },
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
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                      child: Text(
                        widget.user.pseudo,
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            const Text(
                              "Abonnés : ",
                              style: TextStyle(color: Colors.white),
                            ),
                            ImageStack(
                                imageList: Users.genericProfileList,
                                imageCount: 2,
                                totalCount: widget.user.followers,
                                extraCountTextStyle:
                                    const TextStyle(color: Colors.white),
                                backgroundColor: MyColors.AccountFirstColor,
                                imageBorderColor: MyColors.AccountFirstColor,
                                showTotalCount: true),
                          ]),
                          Row(
                            children: [
                              const Text(
                                "Abonnements : ",
                                style: TextStyle(color: Colors.white),
                              ),
                              ImageStack(
                                imageList: Users.genericProfileList,
                                imageCount: 2,
                                totalCount: 68,
                                backgroundColor: MyColors.AccountSecondColor,
                                imageBorderColor: MyColors.AccountSecondColor,
                                extraCountTextStyle:
                                    const TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ]),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(10.0)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          widget.user.description,
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      )),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: Posts.postsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final post = Posts.postsList[index];

                        return PostWidget(
                            post: post, delete: () => deletePost(post));
                      })
                ]),
              ),
            ))))
      ]),
      floatingActionButton: SpeedDial(
        openCloseDial: isDialOpen,
        backgroundColor: MyColors.NewSecondaryColor,
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        animationCurve: Curves.elasticInOut,
        animationDuration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        spaceBetweenChildren: 4,
        spacing: 3,
        overlayColor: MyColors.BackgroundContainerDark,
        overlayOpacity: 0.5,
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            onTap: () => addGenericPost(),
            backgroundColor: MyColors.NewPrimaryColor,
          ),
          SpeedDialChild(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: MyColors.NewPrimaryColor,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const Center(
                        child: PostCreationWidget(),
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.dvr),
              // ignore: avoid_print
              onTap: () => {print(Posts.postsList.toString())})
        ],
      ),
    );
  }
}
