import 'package:flutter/material.dart';
import 'order.dart';

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
  int currentIndex = 0;
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
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Column(
      children: [
        buildRowOne(qusetion),
        buildRowTwo(context, returnText, data, images, equipment),
        // buildRowThree(context, screenW),
      ],
    );
  }
}


Widget buildRowOne(String qusetion) => Container(
      color: const Color(0xFF282c34), // Set background color here
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
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
              const Padding(
                padding:
                    EdgeInsets.only(top: 20, left: 30, right: 170, bottom: 20),
              ),
              boxHome(imagesBOX: images, equipmentBOX: equipment),

              ///////////////////////
              const Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              const boxHome(
                  imagesBOX: "images/ipadNew.png", equipmentBOX: "iPad    "),

              /////////////////////////////
              /// ////////////////////
              const Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              const boxHome(imagesBOX: "images/HDMI.png", equipmentBOX: "HDMI  ")

              /////////////////////////////
            ],
          ),
        ],
      ),
    );

/// ปุ่ม Add
class buttonAdd extends StatefulWidget {
  final Color colorAdd;

  const buttonAdd({super.key, required this.colorAdd});

  @override
  _buttonAddState createState() => _buttonAddState(colorAdd);
}

class _buttonAddState extends State<buttonAdd> {
  late Color colorAdd;
  _buttonAddState(this.colorAdd);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: colorAdd,
          minimumSize: Size(50, 30),
        ),
        child: const Text(
          "Add",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: 'Prompt',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//// กล่องสี่เหลี่ยม
class boxHome extends StatefulWidget {
  final String imagesBOX;
  final String equipmentBOX;
  const boxHome(
      {super.key, required this.imagesBOX, required this.equipmentBOX});

  @override
  State<boxHome> createState() => _boxHomeState(imagesBOX, equipmentBOX);
}

class _boxHomeState extends State<boxHome> {
  late String imagesBOX;
  late String equipmentBOX;
  _boxHomeState(this.imagesBOX, this.equipmentBOX);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(
        padding: EdgeInsets.only(top: 0, left: 20, right: 0, bottom: 0),
      ),
      SizedBox(
        width: 130.0,
        height: MediaQuery.of(context).size.height / 6,
        child: Container(
          color: Color(0xFFd0dce4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 0, left: 10, right: 0, bottom: 0),
              ),
              Center(
                child: SizedBox(
                  width: 110.0,
                  height: 110.0,
                  child: Image.asset(imagesBOX),
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
          color: const Color(0xFF282c34),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 15, left: 15, right: 0, bottom: 0),
                child: Text(
                  equipmentBOX,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 75, right: 0, bottom: 0),
              ),
              Column(
                children: const [
                  Padding(
                    padding:
                        EdgeInsets.only(top: 85, left: 0, right: 0, bottom: 0),
                  ),
                  Expanded(child: buttonAdd(colorAdd: Color(0xFF01adb5))),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}



///////////////// ไม่ได้ใช้แล้ว ปุ่ม home order profile เดิม
///
// Widget buildRowThree(context, screenW) => Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Home",
//             nextPageHome: "MyAppProfile",
//           )),
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Order",
//             nextPageHome: "MyAppProfile",
//           )),
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Profile",
//             nextPageHome: "MyAppProfile",
//           )),
//         ]),
//       ],
//     );

// /// ปุ่มกดข้างล่าง home,order,profile
// class button extends StatefulWidget {
//   final Color colorNew;
//   final String textNew;
//   final String nextPageHome;

//   const button(
//       {super.key,
//       required this.colorNew,
//       required this.textNew,
//       required this.nextPageHome});

//   @override
//   _buttonState createState() => _buttonState(colorNew, textNew, nextPageHome);
// }

// class _buttonState extends State<button> {
//   late Color colorNew;
//   final String textNew;
//   final String nextPageHome;
//   _buttonState(this.colorNew, this.textNew, this.nextPageHome);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.5),
//       child: ElevatedButton(
//         onPressed: () {
//           Navigator.pushNamed(context, '/second');

//           // setState(() {
//           //   colorNew = isCorrect ? Colors.green : Colors.red;
//           //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           //     content:
//           //         isCorrect ? Text("Your Score is 1") : Text("Your Score is 0"),
//           //   ));
//           // });
//         },
//         style: ElevatedButton.styleFrom(
//           primary: colorNew,
//           minimumSize: Size(MediaQuery.of(context).size.width / 4,
//               MediaQuery.of(context).size.height / 10),
//         ),
//         child: Text(
//           textNew,
//           textDirection: TextDirection.ltr,
//           style: const TextStyle(
//             decoration: TextDecoration.none,
//             fontFamily: 'Prompt',
//             fontSize: 20.0,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }