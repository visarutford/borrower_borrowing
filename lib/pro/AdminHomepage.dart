import 'package:flutter/material.dart';
import 'package:rapeepat_first_app/project/lib/pro/adminBorrowing.dart';
import 'adminRequest.dart';
import 'order.dart';
import 'profileOne.dart';
import 'home.dart';
class adminHomePage extends StatefulWidget {
  const adminHomePage({super.key});

  @override
  State<adminHomePage> createState() => _adminHomePageState();
}

class _adminHomePageState extends State<adminHomePage> {
  int currentIndex = 0;

  var prezInfo = {
    1: {
      "title": "Question 1",
      "qusetion": "User1",
      "returnText": "Return date: dd/mm/yyyy",
      "equipment": "Laptop",
      "data":
      "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/laptop.png",
    },
    2: {
      "title": "Question 2",
      "qusetion": "User2",
      "returnText": "Return date: dd/mm/yyyy2",
      "equipment": "Ipad",
      "data":
      "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/ipadNew.png",
    },
    3: {
      "title": "Question 3",
      "qusetion": "User3",
      "returnText": "Return date: dd/mm/yyyy3",
      "equipment": "HDMI",
      "data":
      "Intel(R) Core(TM) i5-7300HQ CPU @ 2.50GHz   2.50 GHz Ram 12.0 GB",
      "images": "images/HDMI.png",
    }

  };

  @override
  Widget build(BuildContext context) {
    final screens = [
        AdminPage(),
      AdminBorrowing()

    ];
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF282c34),
          selectedFontSize: 18,
          unselectedFontSize: 15,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.approval,
                color: Colors.white,
              ),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month,
                color: Colors.white,
              ),
              label: 'Borrowing',
            )
          ],
          // currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          // onTap: _onItemTapped,
        )
    );
  }
}
