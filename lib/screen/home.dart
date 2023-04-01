import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          //SingleChildScrollView = ไม่ให้เกิด btn over flow
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              /*------------- image -------------*/
              Image.asset(
                "images/logo.png",
              ),
              /*------------- image -------------*/

              /*------------- เว้นระยะ -------------*/
              SizedBox(
                height: 15,
              ),
              /*------------- เว้นระยะ -------------*/

              /*------------- Btn เข้าสู้ระบบ -------------*/
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("Login", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return loginScreen();
                      }));
                    }),
              ),
              /*------------- Btn สร้างบัญชีผู้ใช้ -------------*/
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Register", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return registerScreen();
                      }));
                    }),
              ),
              /*------------- Btn สร้างบัญชีผู้ใช้ -------------*/
            ],
          ),
        ),
      ),
    );
  }
}
