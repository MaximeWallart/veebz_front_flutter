import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';
import 'package:veebz_front_flutter/widgets/veebz_important_button.dart';

import '../data/users.dart';
import '../my_colors.dart';

class signUp extends StatefulWidget {
  signUp({Key? key}) : super(key: key);

  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  final TextEditingController _userPasswordConfirmed = TextEditingController();

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  //Crete account function
  Future<User?> createAccountUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
              colors: [
                MyColors.BackgroundAppColor,
                MyColors.NewPrimaryColor,
              ],
              stops: [
                0.5,
                1
              ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                  height: MediaQuery.of(context).size.height / 15,
                ),
                const Text(
                  "Sign up Page",
                  style: TextStyle(
                      color: MyColors.NewPrimaryColor, fontSize: 30.0),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextField(
                  controller: widget._userEmail,
                  textInputAction: TextInputAction.next,
                  maxLines: 1,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: widget._userPassword,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.5),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                TextField(
                  obscureText: true,
                  controller: widget._userPasswordConfirmed,
                  decoration: InputDecoration(
                      fillColor: Colors.white.withOpacity(0.5),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      filled: true,
                      hintText: "Confirm Password",
                      hintStyle: const TextStyle(
                          color: Colors.white, fontStyle: FontStyle.italic)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                VeebzImportantButton(
                    text: "Create account",
                    onPressed: () async {
                      if (widget._userPassword.text ==
                          widget._userPasswordConfirmed.text) {
                        User? user = await createAccountUsingEmailPassword(
                            email: widget._userEmail.text,
                            password: widget._userPassword.text,
                            context: context);
                        print(user);
                        if (user != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProfileView(user: Users.john)));
                        }
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
