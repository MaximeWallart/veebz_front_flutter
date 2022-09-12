import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/models/post.dart';

import '../data/posts.dart';
import '../data/users.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = "";

    TextEditingController _messageController = TextEditingController();

    Post post;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
          borderRadius: BorderRadius.circular(70),
          color: Colors.black.withOpacity(0.5),
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(children: [
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 30, top: 10),
                        child: ElevatedButton(
                          onPressed: () => {
                            post = Post(
                                message: _messageController.text,
                                user: Users.john),
                            Posts.addPost(post, () => Posts.deletePost(post)),
                            Navigator.of(context).pop()
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xFF6432A6)),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                          child: const Text("Envoyer"),
                        ))),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _messageController,
                    minLines: 10,
                    maxLines: 15,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        filled: true,
                        hintText: "Tu veebz sur quoi ?",
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontStyle: FontStyle.italic),
                        fillColor: Colors.white.withOpacity(0.5)),
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ]))),
    );
  }
}
