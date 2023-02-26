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
        initialRoute: '/',
        // routes: {
        //   '/': (context) => const button(
        //         colorNew: Color(0xFF282c34),
        //         textNew: "Profile",
        //         isCorrect: false,
        //       ),
        //   // '/first': (context) => const Exercise2(),
        //   '/second': (context) => const buttonProfileOne(
        //         colorNew: Color(0xFF282c34),
        //         textNew: "Home",
        //         isCorrect: true,
        //       ),
        // },
        home: choiceQuestion());
  }
}
