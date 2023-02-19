import 'package:flutter/material.dart';
import 'screen2.dart';
import 'splashscreen.dart';

class loginpage extends StatefulWidget {
  //const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: 250.0,
          height: 350.0,
          color: Colors.white,
          child: Column(children: [
            Container(
              height: 20.0,
              margin: EdgeInsets.only(top: 30.0, right: 130.0),
              child: Text(
                'Username',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 50.0),
              width: 220.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.black),
              //color: Colors.white,
            ),
            Container(
              height: 20.0,
              margin: EdgeInsets.only(top: 30.0, right: 130.0),
              child: Text(
                'Password',
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ),
            ),
            Container(
              //margin: EdgeInsets.only(top: 50.0),
              width: 220.0,
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.black),
              //color: Colors.white,
            ),
            SizedBox(
              height: 25.0,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Screen2()));
                },
                child: Text(
                  'LOGIN',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }
}
