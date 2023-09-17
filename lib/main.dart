import 'package:flutter/material.dart';
import 'package:flutter_study_0915/secondDetiall.dart';
import 'package:flutter_study_0915/subDetail.dart';
import 'package:flutter_study_0915/thirdDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Widget Example';
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const SubDetail(),
        '/second': (context) => const SecondDetail(),
        '/third': (context) => const ThirdDetail(),
      },
    );
  }
}
