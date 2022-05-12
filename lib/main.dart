import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const ProfileView(),
    );
  }
}
