import 'package:flutter/material.dart';

class VeebzAppBar extends StatelessWidget implements PreferredSizeWidget {
  const VeebzAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text('VEEBZ', style: TextStyle(fontFamily: 'Mulish')),
    );
  }
}
