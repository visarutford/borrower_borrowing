import 'package:flutter/material.dart';
import 'pro/choice.dart';

void main() => runApp(MyWidget());

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter layout demoooo',
        home: choiceQuestion());
  }
}
