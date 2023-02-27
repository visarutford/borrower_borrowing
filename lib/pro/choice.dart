import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:basicflutter/pro/profileTwoProject.dart';
import 'package:basicflutter/pro/profileOne.dart';
import 'package:basicflutter/pro/home.dart';

class choiceQuestion extends StatefulWidget {
  const choiceQuestion({super.key});

  @override
  State<choiceQuestion> createState() => _choiceQuestionState();
}

class _choiceQuestionState extends State<choiceQuestion> {
  var prezInfo = {
    1: {
      "title": "Question 1",
      "qusetion": "User1",
      "returnText": "Return date: dd/mm/yyyy",
      "equipment": "Laptop",
      "data":
          "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/laptop.png",
    },
    2: {
      "title": "Question 2",
      "qusetion": "User2",
      "returnText": "Return date: dd/mm/yyyy2",
      "equipment": "Ipad",
      "data":
          "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/ipadNew.png",
    },
    3: {
      "title": "Question 3",
      "qusetion": "User3",
      "returnText": "Return date: dd/mm/yyyy3",
      "equipment": "HDMI",
      "data":
          "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/HDMI.png",
    }
  };

  @override
  Widget build(BuildContext context) {
    // return MyAppProfile(num: 1, info: prezInfo);
    // return MyAppTest(num: 1, info: prezInfo);
    return MyAppHome(num: 1, info: prezInfo);
  }
}
