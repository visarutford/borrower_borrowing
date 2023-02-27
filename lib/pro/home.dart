import 'package:flutter/material.dart';
import 'profileOne.dart';

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
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Color(0xFF282c34),
      //   selectedFontSize: 18,
      //   unselectedFontSize: 15,
      //   unselectedItemColor: Colors.white,
      //   iconSize: 30,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.account_balance,
      //         color: Colors.white,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.add_shopping_cart,
      //         color: Colors.white,
      //       ),
      //       label: 'Order',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.account_circle,
      //         color: Colors.white,
      //       ),
      //       label: 'Profile',
      //     ),
      //   ],
      //   // currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.white,
      //   // onTap: _onItemTapped,
      // ),
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
              boxHome(imagesBOX: images, equipmentBOX: equipment),

              ///////////////////////
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              boxHome(
                  imagesBOX: "images/ipadNew.png", equipmentBOX: "iPad    "),

              /////////////////////////////
              /// ////////////////////
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
              ),
              boxHome(imagesBOX: "images/HDMI.png", equipmentBOX: "HDMI  ")

              /////////////////////////////
            ],
          ),
        ],
      ),
    );

///////////////// ไม่ได้ใช้แล้ว ปุ่ม home order profile เดิม
///
Widget buildRowThree(context, screenW) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Home",
            iconName: Icons.account_balance,
          )),
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Order",
            iconName: Icons.add_shopping_cart,
          )),
          Expanded(
              child: button(
            colorNew: Color(0xFF282c34),
            textNew: "Profile",
            iconName: Icons.account_circle,
          )),
        ]),
      ],
    );

/// ปุ่มกดข้างล่าง home,order,profile
class button extends StatefulWidget {
  final Color colorNew;
  final String textNew;
  final IconData iconName;

  const button(
      {super.key,
      required this.colorNew,
      required this.textNew,
      required this.iconName});

  @override
  _buttonState createState() => _buttonState(colorNew, textNew, iconName);
}

class _buttonState extends State<button> {
  late Color colorNew;
  final String textNew;
  final IconData iconName;
  _buttonState(this.colorNew, this.textNew, this.iconName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: colorNew,
          minimumSize: Size(MediaQuery.of(context).size.width / 4,
              MediaQuery.of(context).size.height / 10),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              iconName,
              color: Colors.white,
              size: 30.0,
            ),
            SizedBox(
              width: 10,
            ),
            Text(textNew, style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

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
        child: Text(
          "Add",
          textDirection: TextDirection.ltr,
          style: const TextStyle(
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
      Padding(
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
              Padding(
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
          color: Color(0xFF282c34),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 15, right: 0, bottom: 0),
                child: Text(
                  equipmentBOX,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 15, left: 75, right: 0, bottom: 0),
              ),
              Column(
                children: [
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
