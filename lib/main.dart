import 'package:flutter/material.dart';
import 'package:textrecognizer/login.dart';
import 'package:textrecognizer/splashscreen.dart';
import 'screen2.dart';

void main() {
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
            primary: Color(0xFFFFE7ED),
          ),
          scaffoldBackgroundColor: Colors.white //Color(0xFF11061B),
          ),
      home: splashscreen(),
    );
  }
}
