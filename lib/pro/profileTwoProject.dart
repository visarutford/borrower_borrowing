import 'package:flutter/material.dart';

class MyAppTest extends StatefulWidget {
  const MyAppTest({Key? key, required this.num, required this.info})
      : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<MyAppTest> createState() => _MyAppTestState();
}

class _MyAppTestState extends State<MyAppTest> {
  late String title;
  late String qusetion;
  late String returnText;
  late String data;
  late String images;

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
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Scaffold(
      body: Column(
        children: [
          buildRowOne(qusetion),
          buildRowTwo(context, returnText, data, images),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF282c34),
        selectedFontSize: 18,
        unselectedFontSize: 15,
        unselectedItemColor: Colors.white,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        // onTap: _onItemTapped,
      ),
    );
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
                Text('Profile',
                    style: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text(qusetion,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );

Widget buildRowTwo(context, returnText, data, images) => Container(
      color: Color(0xFFd0dce4), // Set background color here
      height: 564,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: 300.0,
                height: MediaQuery.of(context).size.height / 12,
                child: Container(color: Color(0xFFd0dce4)),
              ),
              SizedBox(
                width: 300.0,
                height: MediaQuery.of(context).size.height / 12,
                child: Container(
                  color: Color(0xFF282c34),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 15, left: 15, right: 0, bottom: 0),
                      ),
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset(images),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 70, right: 0, bottom: 0),
                        child: Text(
                          "Labtop",
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
              SizedBox(
                width: 300.0,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 50, left: 20, right: 20, bottom: 30),
                        child: Text(
                          data,
                          style: TextStyle(
                            color: Color(0xFF282c34),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        child: Text(
                          returnText,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );



///// ไม่ได้ใช้

// Widget buildRowThree(context, screenW) => Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Home",
//             isCorrect: true,
//           )),
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Order",
//             isCorrect: false,
//           )),
//           Expanded(
//               child: button(
//             colorNew: Color(0xFF282c34),
//             textNew: "Profile",
//             isCorrect: false,
//           )),
//         ]),
//       ],
//     );

// class button extends StatefulWidget {
//   final Color colorNew;
//   final String textNew;
//   final bool isCorrect;

//   const button(
//       {super.key,
//       required this.colorNew,
//       required this.textNew,
//       required this.isCorrect});

//   @override
//   _buttonState createState() => _buttonState(colorNew, textNew, isCorrect);
// }

// class _buttonState extends State<button> {
//   late Color colorNew;
//   final String textNew;
//   final bool isCorrect;
//   _buttonState(this.colorNew, this.textNew, this.isCorrect);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.5),
//       child: ElevatedButton(
//         onPressed: () {
//           setState(() {
//             colorNew = isCorrect ? Colors.green : Colors.red;
//             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content:
//                   isCorrect ? Text("Your Score is 1") : Text("Your Score is 0"),
//             ));
//           });
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
