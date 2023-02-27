import 'package:flutter/material.dart';
import 'pro/choice.dart';
import 'pro/home.dart';
import 'pro/profileOne.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter layout demoooo',
      home: choiceQuestion(),
      // initialRoute: '/',
      // routes: {
      //   '/s': (context) => const choiceQuestion(),
      //   '/second': (context) => const MyWidget(),
      // },
    );
  }
}
