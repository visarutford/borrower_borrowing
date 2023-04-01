import 'package:flutter/material.dart';
import 'order.dart';
import 'home.dart';


class AdminPage extends StatefulWidget {
  @override
  State<AdminPage> createState() => _AdminPageState();

}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd0dce4),
      body: Center(
        child: Column(
          children: [
            Header(text: "Request"),
            Column(
              children: [
                RequestBox(userName: "xyz@gmail.com",
                    equipment: "equipment",
                    number: "number"),
                RequestBox(userName: "abc@gmail.com",
                    equipment: "equipment",
                    number: "number")
              ],
            )
          ],
        ),
      ),
    );
  }
}

class RequestBox extends StatefulWidget {
  late String userName,equipment,number;

  RequestBox({super.key, required this.userName,required this.equipment,required this. number});

  @override
  State<RequestBox> createState() => _RequestBoxState(userName,equipment,number,);

}

class _RequestBoxState extends State<RequestBox> {
  late String userName, equipment, number;

  _RequestBoxState( this.userName,  this.equipment, this. number);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: Colors.white60,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5,left: 5),
            width: double.infinity,
            height: 35,
            decoration: const BoxDecoration(
              color: Color(0xFF282c34),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
            ),
            child: Text("request from: $userName", style:const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text( "iPad ",
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text( "Laptop ",
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text( "HDMI ",
                          style:  TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:  [
                    adminButton(
                      colorAdd: Colors.green,
                      nameButton: "Approve",
                    ),
                    SizedBox(width: 10),
                    adminButton(
                      colorAdd: Colors.red,
                      nameButton: "Decline",
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class adminButton extends StatefulWidget {
  late final Color colorAdd;
  late final String nameButton;
  adminButton({super.key, required this.colorAdd, required  this.nameButton,
  });
  @override
  _buttonAddState createState() => _buttonAddState(colorAdd,nameButton);
}

class _buttonAddState extends State<buttonAdd> {
  late Color colorAdd;
  late String nameButton;

  _buttonAddState(this.colorAdd, this.nameButton);

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