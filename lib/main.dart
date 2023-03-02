import 'package:flutter/material.dart';
import 'package:textrecognizer/login.dart';
import 'dart:ui';
import 'package:textrecognizer/splashscreen.dart';
import 'screen2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light().copyWith(
            primary: Colors.deepPurple,
          ),
          scaffoldBackgroundColor: Colors.grey[300] //Color(0xFF11061B),
          ),
      home: splashscreen(),
    );
  }
}
