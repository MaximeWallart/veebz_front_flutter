import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';

class VeebzImportantButton extends StatelessWidget {
  const VeebzImportantButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.mainColor = MyColors.NewPrimaryColor,
      this.splashColor = MyColors.NewSecondaryColor})
      : super(key: key);

  final String text;
  final GestureTapCallback onPressed;
  final Color mainColor;
  final Color splashColor;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 20)),
            backgroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return splashColor;
              }
              return mainColor;
            }),
            shape: MaterialStateProperty.all<StadiumBorder>(
                const StadiumBorder())),
        child: Text(text),
        onPressed: onPressed,
      ),
    );
  }
}
