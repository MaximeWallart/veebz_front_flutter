import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';

import 'data/users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: ProfileView(user: Users.john),
    );
  }
}
