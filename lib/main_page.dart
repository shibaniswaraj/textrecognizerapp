import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textrecognizer/login.dart';
import 'package:textrecognizer/screen2.dart';
import 'splashscreen.dart';

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){
          if(snapshot.hasData)
            {
              return screen2();
            }
          else
            {
              return loginpage();
            }
        },
      ),
    );
  }
}
