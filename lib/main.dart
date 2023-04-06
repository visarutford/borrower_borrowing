import 'package:flutter/material.dart';
//import 'package:fordddd/screen/home.dart';
import 'screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color customColor = Color(0xFF282c34);
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: MaterialColor(
            customColor.value,
            <int, Color>{
              50: customColor,
              100: customColor,
              200: customColor,
              300: customColor,
              400: customColor,
              500: customColor,
              600: customColor,
              700: customColor,
              800: customColor,
              900: customColor,
            },
          ),
        ),
        home: const HomeScreen());
  }
}
