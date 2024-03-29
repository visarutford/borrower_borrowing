import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/pro/home.dart';
import 'package:login/screen/home.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'datauser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<Map<String, String>> adminList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  CollectionReference _requestCollection =
  FirebaseFirestore.instance.collection("request");

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('request').get();
    querySnapshot.docs.forEach((doc) {
      Map<String, String> orderData = {
        'item': doc.get('itemDB'),
        'dueDate': doc.get('dueDateDB'),
        'emailDB': doc.get('emailDB'),
      };
      adminList.add(orderData);
    });

    // Call setState to update the state of the widget and trigger a rebuild
    setState(() {});
  }

  @override
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildRowOne(context),
          Container(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: adminList.map((order) {
                    debugPrint("THis is the  number of list :${adminList.length.toString()}");
                    return Container(
                      child: ListTile(
                        title: Text("Request from ${order['emailDB']}"),
                        subtitle: Text(
                            "Item: ${order['item']} \nDue date : ${order['dueDate']}"),
                        trailing: Container(
                          width: 200,
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  // Remove the o rder from the list and update the UI
                                    await Future.delayed(Duration(seconds: 1), () async {

                                      await _requestCollection
                                          .add({
                                        "itemDB": "${order['item']}",
                                        "dueDateDB": "${order['dueDate']}",
                                        "emailDB": "${order['emailDB']}",
                                        "state": "yes",
                                      })
                                          .then((value) => print("User Added"))
                                          .catchError((error) => print("Failed to add user: $error"));

                                      // debugPrint(
                                      //     "Class OrderedItem data item: ${list_of_order[i].item}");
                                      // debugPrint(
                                      //     "Class OrderedItem data item: ${list_of_order[i].dueDate}");
                                      // debugPrint(
                                      //     "Class OrderedItem data item: ${FirebaseAuth.instance.currentUser!.email!}");
                                    });


                                    adminList.remove(order);
                                    setState(() {});
                                },
                                child: Text('Approve'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Remove the order from the list and update the UI
                                  adminList.remove(order);
                                  setState(() {});
                                },
                                child: Text('Decline'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}

Widget buildRowOne(context) {
  return Container(
    color: const Color(0xFF282c34),
    // Set background color here
    height: 170,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),

              /*------------ text Profile -----------------*/
              const Text('Profile',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),

              /*------------ text email -----------------*/
              Text(
                FirebaseAuth.instance.currentUser!.email!,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),

              /*------------ btn Logout -----------------*/
              ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) {
                      return const HomeScreen();
                    })));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 0, 0, 1),
                  minimumSize: Size(50, 30),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildRowTwo(context, returnText, data, images, equipment) => Container(
      color: Color(0xFFd0dce4), // Set background color
      height: 425,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 0, right: 170, bottom: 20),
                  child: Text(
                    "Borrowed items",
                    style: TextStyle(
                      color: Color(0xFF282c34),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ////////////////////
                BoxBorrower(
                  imageBoxBor: images,
                  equipmentBoxBor: equipment,
                  returnBoxBor: returnText,
                ),
                /////////////////////////////
                /// ////////////////////
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
                ),
                BoxBorrower(
                  imageBoxBor: images,
                  equipmentBoxBor: equipment,
                  returnBoxBor: returnText,
                ),

                /////////////////////////////
                /// ////////////////////
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 0, right: 0, bottom: 15),
                ),

                /////////////////////////////
              ],
            ),
          ),
        ],
      ),
    );

class BoxBorrower extends StatefulWidget {
  final String imageBoxBor;
  final String equipmentBoxBor;
  final String returnBoxBor;
  const BoxBorrower(
      {super.key,
      required this.imageBoxBor,
      required this.equipmentBoxBor,
      required this.returnBoxBor});

  @override
  State<BoxBorrower> createState() =>
      _BoxBorrowerState(imageBoxBor, equipmentBoxBor, returnBoxBor);
}

class _BoxBorrowerState extends State<BoxBorrower> {
  late String imageBoxBor;
  late String equipmentBoxBor;
  late String returnBoxBor;

  _BoxBorrowerState(this.imageBoxBor, this.equipmentBoxBor, this.returnBoxBor);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300.0,
          height: MediaQuery.of(context).size.height / 12,
          child: Container(
            color: Color(0xFF282c34),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 0, bottom: 0),
                ),
                SizedBox(
                  width: 80.0,
                  height: 80.0,
                  child: Image.asset(imageBoxBor),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 30, right: 0, bottom: 0),
                  child: Text(
                    equipmentBoxBor,
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
          height: MediaQuery.of(context).size.height / 13,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
                  child: Text(
                    returnBoxBor,
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
    );
  }
}

// class curentUser extends StatelessWidget {
//   final auth = FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Row(
//           children: [
//             Text(
//               FirebaseAuth.instance.currentUser!.email!,
//               style: TextStyle(fontSize: 18, color: Colors.white),
//             ),
//             ElevatedButton(
//               child: Text("Logout"),
//               onPressed: () {
//                 FirebaseAuth.instance.signOut().then((value) {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: ((context) {
//                     return const HomeScreen();
//                   })));
//                 });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }




////// ไม่ได้ใช้แล้ว
///
// Widget buildRowThree(context, screenW) => Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(children: [
//           Expanded(
//               child: buttonProfileOne(
//             colorNew: Color(0xFF282c34),
//             textNew: "Home",
//             isCorrect: true,
//           )),
//           Expanded(
//               child: buttonProfileOne(
//             colorNew: Color(0xFF282c34),
//             textNew: "Order",
//             isCorrect: false,
//           )),
//           Expanded(
//               child: buttonProfileOne(
//             colorNew: Color(0xFF282c34),
//             textNew: "Profile",
//             isCorrect: false,
//           )),
//         ]),
//       ],
//     );

// class buttonProfileOne extends StatefulWidget {
//   final Color colorNew;
//   final String textNew;
//   final bool isCorrect;

//   const buttonProfileOne(
//       {super.key,
//       required this.colorNew,
//       required this.textNew,
//       required this.isCorrect});

//   @override
//   _buttonProfileOneState createState() =>
//       _buttonProfileOneState(colorNew, textNew, isCorrect);
// }

// class _buttonProfileOneState extends State<buttonProfileOne> {
//   late Color colorNew;
//   final String textNew;
//   final bool isCorrect;
//   _buttonProfileOneState(this.colorNew, this.textNew, this.isCorrect);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.5),
//       child: ElevatedButton(
//         onPressed: () => Navigator.of(context).pop(),
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