import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../model/profile.dart';
import 'home.dart';

// ignore: camel_case_types
class registerScreen extends StatefulWidget {
  const registerScreen({super.key});
  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen> {
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
              title: const Text("Register user"),
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
                            child: const Text("Register"),
                            onPressed: () async {
                              /*---------- ทำการ save ค่าละเก็บข้อมูล -------------*/
                              if (formkey.currentState!.validate()) {
                                formkey.currentState?.save();
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                          email: profile.email!,
                                          password: profile.password!)
                                      .then((value) {
                                    formkey.currentState?.reset();
                                    Fluttertoast.showToast(
                                        msg: "Account created successfully",
                                        gravity: ToastGravity.CENTER);
                                    /*---------- ส่งไปหน้า HomeScreen() -------------*/
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: ((context) {
                                      return const HomeScreen();
                                    })));
                                  });

                                  /*---------- ทำการ check error -------------*/

                                } on FirebaseAuthException catch (e) {
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
