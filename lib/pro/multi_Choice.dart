import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class multiChoice extends StatefulWidget {
  const multiChoice({Key? key, required this.num, required this.info})
      : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<multiChoice> createState() => _multiChoiceState();
}

class _multiChoiceState extends State<multiChoice> {
  late String title;
  late String qusetion;
  late String imageURL;
  late List<String> choices;
  late List<bool> corrects;

  bool previous = false;
  Widget? nextPresident;

  @override
  void initState() {
    super.initState();
    title = widget.info[widget.num]["title"];
    qusetion = widget.info[widget.num]["qusetion"];
    imageURL = widget.info[widget.num]["imageURL"];
    choices = widget.info[widget.num]["choices"];
    corrects = widget.info[widget.num]["corrects"];
    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextPresident = multiChoice(num: widget.num + 1, info: widget.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Scaffold(
        appBar: screenW <= 600
            ? AppBar(title: Text(title), backgroundColor: Colors.green)
            : null,
        body: Column(
          children: [
            buildRowOne(qusetion),
            buildRowTwo(context, imageURL),
            buildRowThree(context, screenW, choices, corrects),
            Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Visibility(
                    visible: previous,
                    child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Previous")),
                  ),
                  Visibility(
                    visible: nextPresident != null,
                    child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    nextPresident ?? Container())),
                        child: const Text("Next")),
                  )
                ]))
          ],
        ));
  }
}

Widget buildRowOne(String qusetion) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(qusetion, style: TextStyle(fontSize: 26, color: Colors.pink)),
      ],
    );

Widget buildRowTwo(context, String imageURL) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300.0,
          height: MediaQuery.of(context).size.height / 2.5,
          child: Image.asset(imageURL),
        )
      ],
    );

Widget buildRowThree(context, screenW, choices, corrects) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
              child: button(
            colorNew: Colors.black,
            textNew: choices[0],
            isCorrect: corrects[0],
          )),
          Expanded(
              child: button(
            colorNew: Colors.blue,
            textNew: choices[1],
            isCorrect: corrects[1],
          )),
        ]),
        Row(children: [
          Expanded(
              child: button(
            colorNew: Colors.brown,
            textNew: choices[2],
            isCorrect: corrects[2],
          )),
          Expanded(
              child: button(
            colorNew: Colors.orange,
            textNew: choices[3],
            isCorrect: corrects[3],
          )),
        ])
      ],
    );

class button extends StatefulWidget {
  final Color colorNew;
  final String textNew;
  final bool isCorrect;

  const button(
      {super.key,
      required this.colorNew,
      required this.textNew,
      required this.isCorrect});

  @override
  _buttonState createState() => _buttonState(colorNew, textNew, isCorrect);
}

class _buttonState extends State<button> {
  late Color colorNew;
  final String textNew;
  final bool isCorrect;
  _buttonState(this.colorNew, this.textNew, this.isCorrect);
  /////////////////////
  int _counter = 1;

  ///////////////////
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            colorNew = isCorrect ? Colors.green : Colors.red;
            isCorrect ? _counter = 1 : _counter = 0;
          });
          ///////////////
        },
        ///////////
        style: ElevatedButton.styleFrom(
          primary: colorNew,
          minimumSize: Size(MediaQuery.of(context).size.width / 4,
              MediaQuery.of(context).size.height / 10),
        ),
        child: Text(
          textNew,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Prompt',
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
