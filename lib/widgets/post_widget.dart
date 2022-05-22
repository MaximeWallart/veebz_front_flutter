import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:veebz_front_flutter/my_colors.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

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
            const Padding(
              padding: EdgeInsets.all(5),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1501196354995-cbb51c65aaea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"),
                    radius: 19),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "John John",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "@XxJohnJohn_du_59xX",
                    style: TextStyle(color: Colors.white54, fontSize: 13),
                  ),
                ]),
            const Spacer(),
            IconButton(
                onPressed: () {
                  // ignore: avoid_print
                  print("eheh");
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
            const Padding(
              padding: EdgeInsets.all(10),
              child: LikeButton(
                likeCount: 75,
                countPostion: CountPostion.bottom,
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.73),
              child: const Text(
                "Écoutez moi cette petite dingz que viens de sortir mon pote Tyler ✨✨",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
