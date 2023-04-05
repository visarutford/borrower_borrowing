import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/home.dart';
import 'home.dart';
import 'order.dart';

class AdminBorrowing extends StatefulWidget {
  @override
  State<AdminBorrowing> createState() => AdminBorrowingState();
}

class AdminBorrowingState extends State<AdminBorrowing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd0dce4),
      body: Center(
        child: Column(
          children: [
            Container(
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
                        const Text('Borrowing',
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
            ),
            boxHome(
              imagesBOX: "images/ipadNew.png",
              equipmentBOX: "iPad",
              userName: "xyz@gmail.com",
              dueDate: 'xx/yy/zz',
            ),
            boxHome(
              imagesBOX: "images/laptop.png",
              equipmentBOX: "Laptop",
              userName: "abc@gmail.com",
              dueDate: 'xx/yy/zz',
            )
          ],
        ),
      ),
    );
  }
}

class boxHome extends StatefulWidget {
  final String imagesBOX;
  final String equipmentBOX, userName, dueDate;
  const boxHome(
      {super.key,
      required this.imagesBOX,
      required this.userName,
      required this.dueDate,
      required this.equipmentBOX});

  @override
  State<boxHome> createState() =>
      _boxHomeState(imagesBOX, equipmentBOX, userName, dueDate);
}

class _boxHomeState extends State<boxHome> {
  late String imagesBOX;
  late String equipmentBOX, userName, dueDate;
  _boxHomeState(this.imagesBOX, this.equipmentBOX, this.userName, this.dueDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF282c34),
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Container(
            width: 170.0,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Image.asset(
              imagesBOX,
              width: 200,
              height: 200,
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(7),
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
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "user: $userName",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "due: $dueDate",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      clearButton(colorAdd: Colors.blue, nameButton: "clear")
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

class clearButton extends StatefulWidget {
  late final Color colorAdd;
  late final String nameButton;
  clearButton({super.key, required this.colorAdd, required  this.nameButton,
  });
  @override
  _clearButtonState createState() => _clearButtonState(colorAdd,nameButton);
}

class _clearButtonState extends State<clearButton> {
  late Color colorAdd;
  late String nameButton;

  _clearButtonState(this.colorAdd, this.nameButton);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: ElevatedButton(
        onPressed: () {
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