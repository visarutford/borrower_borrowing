import 'package:flutter/material.dart';
import 'home.dart';
class Header extends StatelessWidget {
  final String text;
  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF282c34),
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
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Text( text,
                      style: const TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ],
        )
    );
  }
}



class MyOrder extends StatefulWidget {
  const MyOrder({Key? key, required this.num, required this.info})
      : super(key: key);
  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
      backgroundColor: const Color(0xFFd0dce4),
      body: Column(
        children: [
         const Header(text: "Order"),
          SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 5, bottom: 10),
                  decoration:const BoxDecoration(
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)
          ),
              color: Colors.white70
            ),child: Column(
            children: [BoxBorrower(
              imageBoxBor: "images/HDMI.png",
              equipmentBoxBor: "HDMI",
              returnBoxBor: returnText,
            ),
              BoxBorrower(
                imageBoxBor: "images/ipadNew.png",
                equipmentBoxBor: "iPad",
                returnBoxBor: returnText,
              ),
              BoxBorrower(imageBoxBor: "images/laptop.png", equipmentBoxBor: "Laptop", returnBoxBor: returnText),

              buttonAdd(colorAdd: Colors.blueAccent, nameButton: "Confirm")
            ],

          ),
          )



        ],
      ),
    );
  }
}


class OrderBox extends StatefulWidget {
  late String imgURL, itemName;
  OrderBox({Key? key, required this.imgURL, required this.itemName});

  @override
  State<OrderBox> createState() => _OrderBoxState(itemName, imgURL);
}

class _OrderBoxState extends State<OrderBox>{
  _OrderBoxState(String itemName, String imgURL);
  late String imgURL, itemName;

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(itemName)],);
  }
}

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
            height: 85,
            decoration: const BoxDecoration(
              color: Color(0xFF282c34),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
            ),
            child: Image.asset(imageBoxBor),
          ),Expanded(child: Container(
              margin: const EdgeInsets.all(20),
              child:Row(
                children: [
                  Text(equipmentBoxBor, style: const TextStyle(color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,),),
                  const Spacer(),
                  const Icon(Icons.delete_forever, color: Colors.red,)

                ],
              )
          ))
        ],
      ),
    );
  }
}

