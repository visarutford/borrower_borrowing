import 'package:flutter/material.dart';
import 'order.dart';

var iPadTime, laptopTime, hdmiTime;
var item_list = [];
var date_list = [];

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          buildRowOne(qusetion),
          buildRowTwo(context, returnText, data, images, equipment),
          // buildRowThree(context, screenW),
        ],
      ),
    );
  }
}

class buttonDate extends StatefulWidget {
  String equipmentNameDate;
  buttonDate({super.key, required this.equipmentNameDate});

  @override
  State<buttonDate> createState() => _buttonDateState(equipmentNameDate);
}

class _buttonDateState extends State<buttonDate> {
  late String equipmentNameDate;
  _buttonDateState(this.equipmentNameDate);
  DateTime _dateTime = DateTime.now();

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    ).then((value) => {
      setState(() {
        _dateTime = value!;
        debugPrint(equipmentNameDate);
        if (equipmentNameDate == "iPad") {
          iPadTime = _dateTime.day.toString() +
              "/" +
              _dateTime.month.toString() +
              "/" +
              _dateTime.year.toString();
        }
        if (equipmentNameDate == "Laptop") {
          laptopTime = _dateTime.day.toString() +
              "/" +
              _dateTime.month.toString() +
              "/" +
              _dateTime.year.toString();
        }
        if (equipmentNameDate == "HDMI") {
          hdmiTime = _dateTime.day.toString() +
              "/" +
              _dateTime.month.toString() +
              "/" +
              _dateTime.year.toString();
        }
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Text(dateVar, style: TextStyle(fontSize: 15, color: Colors.white)),
        MaterialButton(
          onPressed: _showDatePicker,
          child: Text("Choose Date", style: TextStyle(color: Colors.white)),
          color: Colors.blue,
        ),
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

Widget buildRowTwo(context, returnText, data, images, equipment) =>
    Center(
      child: Column(
        children: [
          boxHome(imagesBOX: "images/laptop.png", equipmentBOX: "Laptop", itemName: "Laptop", itemDate: "xx/yy/zz",),
           boxHome(imagesBOX: "images/ipadNew.png", equipmentBOX: "iPad",itemName: "iPad",itemDate: "xx/yy/zz",),
           boxHome(imagesBOX: "images/HDMI.png", equipmentBOX: "HDMI",itemName: "HDMI",itemDate: "xx/yy/zz")
          /////////////////////////////
        ],
      ),
    );


/// ปุ่ม Add
class buttonAdd extends StatefulWidget {
  final Color colorAdd;
  final String nameButton;
  late String itemName;
  late String itemDate;
  buttonAdd({super.key, required this.colorAdd, required  this.nameButton,
  required this.itemName, required this.itemDate});
  @override
  _buttonAddState createState() => _buttonAddState(colorAdd,nameButton,itemName,itemDate);
}

class _buttonAddState extends State<buttonAdd> {
  late Color colorAdd;
  late String nameButton;
  late String itemName;
  late String itemDate;
  _buttonAddState(this.colorAdd, this.nameButton, this.itemName, this.itemDate);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ElevatedButton(
        onPressed: () {
          item_list.add(itemName);

          if (itemName == "iPad") {
            date_list.add(iPadTime);
          } if (itemName == "Laptop") {
            date_list.add(laptopTime);
          }if (itemName == "HDMI") {
            date_list.add(hdmiTime);
          }



          debugPrint("List of item: $item_list \n List of date: $date_list ");
        },
        style: ElevatedButton.styleFrom(
          primary: colorAdd,
          minimumSize: Size(50, 30),

        ),
        child:  Text(
          nameButton,
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
  final String itemDate;
  final String itemName;
  const boxHome(
      {super.key, required this.imagesBOX, required this.equipmentBOX,
      required this.itemDate, required this.itemName});

  @override
  State<boxHome> createState() => _boxHomeState(imagesBOX, equipmentBOX,itemDate,itemName);
}

class _boxHomeState extends State<boxHome> {
  late String imagesBOX;
  late String equipmentBOX;
  late String itemDate;
  late String itemName;
  _boxHomeState(this.imagesBOX, this.equipmentBOX, this.itemDate, this.itemName);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF282c34),
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
        child:  Row(
          children: [
            Container(
              width: 170.0,
              height: 130,
              decoration: const BoxDecoration(
                color: Color(0xFFd0dce4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: Image.asset(imagesBOX),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          equipmentBOX,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        buttonDate(equipmentNameDate: equipmentBOX),
                         buttonAdd(
                          colorAdd: Colors.green,
                          nameButton: "Add",
                          itemDate: itemDate,
                          itemName: itemName,

                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
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