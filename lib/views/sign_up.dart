import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';
import 'package:veebz_front_flutter/widgets/veebz_important_button.dart';

import '../data/users.dart';
import '../my_colors.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  //Crete account function
  Future<User?> createAccountUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    user = userCredential.user;
  } on FirebaseAuthException catch (e){
    print(e.message);
  }

  return user;
}

  @override
  Widget build(BuildContext context) {
    TextEditingController _userEmail = TextEditingController();
    TextEditingController _userPassword = TextEditingController();
    TextEditingController _userPasswordConfirmed = TextEditingController();
    bool isPasswordMatched = false;
    return  Scaffold(
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
                height: MediaQuery.of(context).size.height / 30,
              ),
              TextField(
                controller: _userEmail,
                maxLines: 1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                    hintText: "Email",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              TextField(
                obscureText: true,
                controller: _userPassword,
                decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              TextField(
                obscureText: true,
                controller: _userPasswordConfirmed,
                decoration: InputDecoration(
                    fillColor: Colors.white.withOpacity(0.5),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              VeebzImportantButton(text: "create account", onPressed: (
                  ) async {
                if (_userPassword.text == _userPasswordConfirmed.text){
                  User? user = await createAccountUsingEmailPassword(
                      email: _userEmail.text,
                      password: _userPassword.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileView(
                        user: Users.john)));
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
