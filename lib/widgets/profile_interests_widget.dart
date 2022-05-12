import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/widgets/profile_picture.dart';

class ProfileInterestsWidget extends StatelessWidget {
  const ProfileInterestsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(child: Stack(children: const [ProfilePicture()])),
    );
  }
}
