import 'dart:math';

import 'package:veebz_front_flutter/models/user.dart';

class Post {
  final String message;
  final User user;
  int nmbLike;

  Post({required this.message, required this.user})
      : nmbLike = Random().nextInt(100);
}
