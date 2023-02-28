import 'package:flutter/material.dart';

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
          SizedBox(height: 10,),
          BoxBorrower(
            imageBoxBor: "images/ipadNew.png",
            equipmentBoxBor: "iPad",
            returnBoxBor: returnText,
          ),SizedBox(height: 10,),
          BoxBorrower(
            imageBoxBor: images,
            equipmentBoxBor: equipment,
            returnBoxBor: returnText,
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
    return Column(
      children: [
        SizedBox(
          width: 370.0,
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
                ),Spacer(),Padding(padding:
                EdgeInsets.only(top: 20,left: 130),
                child: Icon(Icons.delete_forever_outlined,color: Colors.red,size: 30,),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

