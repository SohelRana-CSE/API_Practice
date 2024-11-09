import 'package:api_practice/example_five.dart';
import 'package:api_practice/example_four.dart';
import 'package:api_practice/example_three.dart';
import 'package:api_practice/example_two.dart';
import 'package:api_practice/home_screen.dart';
import 'package:api_practice/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignUpScreen(),
    );
  }
}
