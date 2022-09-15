import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:veebz_front_flutter/my_colors.dart';

import '../models/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  final Function delete;

  const PostWidget({Key? key, required this.post, required this.delete})
      : super(key: key);

  void handleClick(String value) {
    switch (value) {
      case 'Supprimer':
        delete();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(post.user.profilePicLink),
                    radius: 19),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                post.user.pseudo,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.left,
              ),
              Text(
                "@" + post.user.address,
                style: const TextStyle(color: Colors.white54, fontSize: 13),
              ),
            ]),
            const Spacer(),
            PopupMenuButton(
                color: Colors.white,
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onSelected: handleClick,
                itemBuilder: (BuildContext context) {
                  return {'Supprimer'}.map((String choice) {
                    return PopupMenuItem<String>(
                        value: choice, child: Text(choice));
                  }).toList();
                })
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
                likeCount: post.nmbLike,
                countPostion: CountPostion.bottom,
                likeCountAnimationDuration: const Duration(milliseconds: 200),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.73),
              child: Text(
                post.message,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
