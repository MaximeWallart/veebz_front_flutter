import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Initialize Firebase App
  Future<FirebaseApp> _initializeFirebaseApp() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    const MaterialColor _colorPalette = MaterialColor(0xFFFFD6CC, <int, Color>{
      50: Color(0xFFFFF5F3),
      100: Color(0xFFFFE6E0),
      200: Color(0xFFFFD6CC),
      300: Color(0xFFFFC6B8),
      400: Color(0xFFFFB9A8),
      500: Color(0xFFFFAD99),
      600: Color(0xFFFFA691),
      700: Color(0xFFFF9C86),
      800: Color(0xFFFF937C),
      900: Color(0xFFFF836B),
    });

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: _colorPalette,
        fontFamily: 'ABeeZee',
      ),
      home: FutureBuilder(
        future: _initializeFirebaseApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginView();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
