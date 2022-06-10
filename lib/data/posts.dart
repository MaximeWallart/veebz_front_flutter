import 'package:veebz_front_flutter/data/users.dart';

import '../models/post.dart';
import '../models/user.dart';
import '../widgets/post_widget.dart';

class Posts {
  static List<Post> postsList = [
    Post(
        message:
            "Écoutez moi cette petite dingz que viens de sortir mon pote Tyler ✨✨",
        user: Users.john),
    Post(
        message:
            "Ça fait trop longtemps que je suis pas allé à un concert ça me manque troooop !!!",
        user: Users.pierre),
    Post(message: "Pas fou le dernier son de John John hein", user: Users.jean)
  ];

  static void deletePost(post) {
    postsList.removeWhere((element) => element == post);
  }

  static void addPost(post, function) {
    postsList.add(post);
  }
}
