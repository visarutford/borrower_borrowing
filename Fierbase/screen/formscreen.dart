import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../model/student.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

//final formKey = GlobalKey<FormState>();
class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>(); //pull data from student.dart
  Student myStudent = Student();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();
  // สร้างตาราง

  CollectionReference _studentCollection =
      FirebaseFirestore.instance.collection("request");
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebase,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: Text('แปปฟอมคะแนน'),
            ),
            body: Container(
              padding: EdgeInsets.all(10),
              child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ชื่อนักเรียน',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'err'),
                          /*---------------- save fname -------------*/
                          onSaved: (String? fname) {
                            myStudent.fname = fname;
                          },
                          /*---------------- save fname -------------*/
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'นามสกุล',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'err'),
                          onSaved: (String? lname) {
                            myStudent.lname = lname;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'อีเมล',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'err'),
                          onSaved: (String? email) {
                            myStudent.email = email;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'คะแนน',
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          validator: RequiredValidator(errorText: 'err'),
                          onSaved: (String? score) {
                            myStudent.score = score;
                          },
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            child: Text(
                              'บันทึกข้อมูล',
                              style: TextStyle(fontSize: 20),
                            ),
                            onPressed: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                formKey.currentState?.save();

                                print("fname = ${myStudent.fname}");
                                print("lname = ${myStudent.lname}");
                                print("emil = ${myStudent.email}");
                                print("score = ${myStudent.score}");

                                await _studentCollection.add({
                                  "fname": myStudent.fname,
                                  "lname": myStudent.lname,
                                  "email": myStudent.email,
                                  "score": myStudent.score,
                                });
                                formKey.currentState?.reset();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
