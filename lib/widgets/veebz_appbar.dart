import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/data/posts.dart';

class VeebzAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VeebzAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: MediaQuery.of(context).size.width * 0.43,
        title: GestureDetector(
          onTap: () {
            print(Posts.postsList.length);
          },
          child: Image.asset(
            'assets/images/Veebz_logo.png',
            fit: BoxFit.contain,
            height: 50,
          ),
        )
        // title: const Text('VEEBZ',
        //     style: TextStyle(fontFamily: 'Mulish', fontSize: 30.0)),
        );
  }
}
