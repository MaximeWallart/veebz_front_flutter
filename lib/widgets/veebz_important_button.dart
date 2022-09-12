import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';

class VeebzImportantButton extends StatelessWidget {
  const VeebzImportantButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        fillColor: MyColors.NewPrimaryColor,
        splashColor: MyColors.NewTertiaryColor,
        constraints: BoxConstraints.loose(
            Size.fromWidth(MediaQuery.of(context).size.width)),
        child: Text(text),
        onPressed: onPressed,
        shape: const StadiumBorder());
  }
}
