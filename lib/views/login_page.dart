import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/widgets/veebz_important_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login Page",
              style: TextStyle(color: MyColors.NewPrimaryColor, fontSize: 30.0),
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  )),
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  )),
            ),
            VeebzImportantButton(
                text: "Login",
                onPressed: () {
                  // ignore: avoid_print
                  print("test button");
                })
          ],
        ),
      ),
    );
  }
}
