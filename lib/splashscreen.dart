import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    _navigatelogin();
  }

  _navigatelogin() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => loginpage()));
  }

  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFFD9F5FE), Color(0xFFFFE7ED)]),
      ),
      child: Center(
        child: Image.asset(
          'image/logo.jfif',
          height: 110.0,
          width: 110.0,
        ),
      ),
    );
  }
}
