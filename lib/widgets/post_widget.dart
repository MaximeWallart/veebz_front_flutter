import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'dart:math';

import '../models/user.dart';

class PostWidget extends StatelessWidget {
  final User user;

  final String message;

  final Function delete;

  const PostWidget(
      {Key? key,
      required this.user,
      required this.message,
      required this.delete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int nmb = Random().nextInt(100);

    return Container(
      decoration: const BoxDecoration(
          color: MyColors.BackgroundContainerDark,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(user.profilePicLink),
                    radius: 19),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                user.pseudo,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.left,
              ),
              Text(
                "@" + user.address,
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ]),
            const Spacer(),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("eheh");
                  delete();
                },
                icon: const Icon(
                  Icons.more_vert,
                  size: 25.0,
                  color: Colors.white,
                ))
          ],
        ),
        const Divider(
          color: Colors.white,
          indent: 50,
          endIndent: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: LikeButton(
                likeCount: nmb,
                countPostion: CountPostion.bottom,
                likeCountAnimationDuration: const Duration(milliseconds: 200),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.73),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
