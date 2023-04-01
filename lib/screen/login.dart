import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login/pro/AdminHomepage.dart';
import 'package:login/pro/choice.dart';
import '../model/profile.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Error"),
            ),
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Login"),
            ),
            body: Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Email", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please enter your email"),
                            EmailValidator(errorText: "Incorrect e-mail")
                          ]),
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: 'Email',
                            hintText: 'Enter your email address',
                          ),
                          /*---------- เก็บค่า user ป้อนคือ profile.email -------------*/
                          onSaved: (String? userEmail) {
                            profile.email = userEmail;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Password", style: TextStyle(fontSize: 20)),
                        TextFormField(
                          validator: RequiredValidator(
                              errorText: "Please enter your password"),
                          obscureText: true,
                          decoration: const InputDecoration(
                            icon: Icon(Icons.remove_red_eye),
                            labelText: 'Password',
                            hintText: 'Enter your email address',
                          ),
                          /*---------- เก็บค่า user ป้อนคือ profile.password -------------*/
                          onSaved: (String? userPassword) {
                            profile.password = userPassword;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: const Text("Login"),
                            onPressed: () async {
                              /*---------- ทำการ save ค่าละเก็บข้อมูล -------------*/
                              if (formkey.currentState!.validate()) {
                                formkey.currentState?.save();
                                /*---------- check ค่าแบบไม่ต้องใช้ if ใช้ .signInWithEmailAndPassword แทน -------------*/
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: profile.email!,
                                          password: profile.password!)
                                      .then((value) {
                                    formkey.currentState!.reset();
                                    /*---------- check admin account -------------*/
                                    if (profile.email! == "admin@hotmail.com" &&
                                        profile.password! == '123456') {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                              builder: ((context) {
                                        return const adminHomePage();
                                      })));
                                    } else {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                              builder: ((context) {
                                        return const choiceQuestion();
                                      })));
                                    }
                                  });
                                }
                                /*---------- ทำการ check error -------------*/
                                on FirebaseAuthException catch (e) {
                                  //print(e.message);
                                  //print(e.code);
                                  Fluttertoast.showToast(
                                      msg: e.message!,
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        /*---------- เพิ่อมันเกิด error ที่ไม่รู้จัก -------------*/
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
