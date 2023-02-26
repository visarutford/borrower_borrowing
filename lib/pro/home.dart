import 'package:flutter/material.dart';

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key, required this.num, required this.info})
      : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<MyAppHome> createState() => _MyAppHomeState();
}

class _MyAppHomeState extends State<MyAppHome> {
  late String title;
  late String qusetion;
  late String returnText;
  late String data;
  late String images;
  late String equipment;

  bool previous = false;
  Widget? nextPresident;

  @override
  void initState() {
    super.initState();
    title = widget.info[widget.num]["title"];
    qusetion = widget.info[widget.num]["qusetion"];
    returnText = widget.info[widget.num]["returnText"];
    data = widget.info[widget.num]["data"];
    images = widget.info[widget.num]["images"];
    equipment = widget.info[widget.num]["equipment"];

    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextPresident = MyAppHome(num: widget.num + 1, info: widget.info);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Scaffold(
        body: Column(
      children: [
        buildRowOne(qusetion),
        buildRowTwo(context, returnText, data, images, equipment),
        buildRowThree(context, screenW),
      ],
    ));
  }
}

Widget buildRowOne(String qusetion) => Container(
      color: Color(0xFF282c34), // Set background color here
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                ),
                Text('Home',
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ],
      ),
    );

Widget buildRowTwo(context, returnText, data, images, equipment) => Container(
      color: Colors.white, // Set background color here
      height: 553.5,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 30, right: 170, bottom: 20),
              ),
              ////////////////////
              Row(children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
                ),
                SizedBox(
                  width: 130.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFFd0dce4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 0, bottom: 0),
                        ),
                        Center(
                          child: SizedBox(
                            width: 110.0,
                            height: 110.0,
                            child: Image.asset(images),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 224.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFF282c34),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 0, bottom: 0),
                          child: Text(
                            equipment,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

              /////////////////////////////
              /// ////////////////////
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              Row(children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
                ),
                SizedBox(
                  width: 130.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFFd0dce4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 0, bottom: 0),
                        ),
                        Center(
                          child: SizedBox(
                            width: 110.0,
                            height: 110.0,
                            child: Image.asset(images),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 224.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFF282c34),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 0, bottom: 0),
                          child: Text(
                            equipment,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

              /////////////////////////////
              /// ////////////////////
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              Row(children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
                ),
                SizedBox(
                  width: 130.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFFd0dce4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 10, right: 0, bottom: 0),
                        ),
                        Center(
                          child: SizedBox(
                            width: 110.0,
                            height: 110.0,
                            child: Image.asset(images),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 224.0,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Container(
                    color: Color(0xFF282c34),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 15, right: 0, bottom: 0),
                          child: Text(
                            equipment,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),

              /////////////////////////////
            ],
          ),
        ],
      ),
    );

Widget buildRowThree(context, screenW) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Home",
            isCorrect: true,
          )),
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Order",
            isCorrect: false,
          )),
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Profile",
            isCorrect: false,
          )),
        ]),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/second');

          // setState(() {
          //   colorNew = isCorrect ? Colors.green : Colors.red;
          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //     content:
          //         isCorrect ? Text("Your Score is 1") : Text("Your Score is 0"),
          //   ));
          // });
        },
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
