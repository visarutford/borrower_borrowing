import 'package:flutter/material.dart';
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
            Header(text: "Borrowing"),
            boxHome(imagesBOX: "images/ipadNew.png", equipmentBOX: "iPad",
              userName:"xyz@gmail.com", dueDate: 'xx/yy/zz' ,),
            boxHome(imagesBOX: "images/laptop.png", equipmentBOX: "Laptop",
              userName:"abc@gmail.com", dueDate: 'xx/yy/zz' ,)
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
      {super.key, required this.imagesBOX,required this.userName,required this.dueDate, required this.equipmentBOX});

  @override
  State<boxHome> createState() => _boxHomeState(imagesBOX, equipmentBOX, userName, dueDate);
}

class _boxHomeState extends State<boxHome> {
  late String imagesBOX;
  late String equipmentBOX,userName, dueDate;
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
      child:  Row(
        children: [
          Container(
            width: 170.0,
            decoration: const BoxDecoration(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("user: $userName",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("due: $dueDate",
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      buttonAdd(
                        colorAdd: Colors.blue,
                        nameButton: "clear",
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

