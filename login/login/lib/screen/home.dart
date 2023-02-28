import 'package:flutter/material.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/register.dart';

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
              /*------------- image -------------*/
              Image.asset("images/addit.png"),
              /*------------- image -------------*/

              /*------------- เว้นระยะ -------------*/
              SizedBox(
                height: 15,
              ),
              /*------------- เว้นระยะ -------------*/

              /*------------- Btn สร้างบัญชีผู้ใช้ -------------*/
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Regidter", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return registerScreen();
                      }));
                    }),
              ),
              /*------------- Btn สร้างบัญชีผู้ใช้ -------------*/

              /*------------- Btn เข้าสู้ระบบ -------------*/
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    icon: Icon(Icons.login),
                    label: Text("login", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return loginScreen();
                      }));
                    }),
              ),
              /*------------- Btn เข้าสู้ระบบ -------------*/
            ],
          ),
        ),
      ),
    );
  }
}
