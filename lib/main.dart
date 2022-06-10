import 'package:flutter/material.dart';
import 'package:veebz_front_flutter/views/profile_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map<int, Color> _purpleMap = {
    //   50: const Color(0xFF9D72D5),
    //   100: const Color(0xFF9262D0),
    //   200: const Color(0xFF8752CB),
    //   300: const Color(0xFF7C43C7),
    //   400: const Color(0xFF7238BC),
    //   500: const Color(0xFF6834AD),
    //   600: const Color(0xFF5F2F9D),
    //   700: const Color(0xFF552A8D),
    //   800: const Color(0xFF4C267E),
    //   900: const Color(0xFF42216E),
    // };

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'ABeeZee',
      ),
      home: const ProfileView(),
    );
  }
}
