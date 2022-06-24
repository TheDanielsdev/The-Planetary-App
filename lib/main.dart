import 'package:flutter/material.dart';
import 'package:the_planetary/screens/home_page.dart';
import 'package:the_planetary/screens/onboarding.dart';
import 'package:the_planetary/screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
