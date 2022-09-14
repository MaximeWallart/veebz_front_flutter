import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/my_colors.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';
import 'package:veebz_front_flutter/views/sign_up.dart';
import 'package:veebz_front_flutter/widgets/veebz_important_button.dart';

import '../data/users.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

@override
State<LoginPage> createState() => _LoginPageState();

class _LoginPageState extends State<LoginPage> {
  //Login function
  Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.BackgroundAppColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Image.asset(
                'assets/images/Veebz_logo.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.width / 2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              const Text(
                "Login Page",
                style:
                    TextStyle(color: MyColors.NewPrimaryColor, fontSize: 30.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              TextField(
                controller: widget._emailController,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontStyle: FontStyle.italic),
                    fillColor: Colors.white.withOpacity(0.5)),
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              TextField(
                controller: widget._passwordController,
                obscureText: true,
                textInputAction: TextInputAction.next,
                maxLines: 1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontStyle: FontStyle.italic),
                    fillColor: Colors.white.withOpacity(0.5)),
                style: const TextStyle(color: Colors.white),
              ),
              VeebzImportantButton(
                  text: "Login",
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: widget._emailController.text,
                        password: widget._passwordController.text,
                        context: context);
                    // ignore: avoid_print
                    print(user);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProfileView(
                                user: Users.john,
                              )));
                    }
                  }),
              VeebzImportantButton(
                  text: "Sign up",
                  onPressed: () async {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => signUp()));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
