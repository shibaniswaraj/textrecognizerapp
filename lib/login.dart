import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen2.dart';
import 'splashscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class loginpage extends StatefulWidget {
  //const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}


class _loginpageState extends State<loginpage> {

 final _emailcontroller= TextEditingController();
 final _passwordcontroller=TextEditingController();
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
     body: SafeArea(
       child:Center(
         child: SingleChildScrollView(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Icon(Icons.android,size: 100,),
               SizedBox(height: 75.0,),

               Text('WELCOME BACK!',
                 style: GoogleFonts.bebasNeue(fontSize: 52)),
               SizedBox(height: 10.0,),
               Text('Login for better experience.',
               style: TextStyle(fontSize: 20),),
               SizedBox(height: 50.0,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.grey[200],
                     border: Border.all(color: Colors.white),
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 12.0),
                     child: TextField(
                       controller: _emailcontroller,
                       decoration: InputDecoration(
                         border: InputBorder.none,
                             hintText: 'Email'
                       ),
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height: 10.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.grey[200],
                     border: Border.all(color: Colors.white),
                     borderRadius: BorderRadius.circular(12),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 12.0),
                     child: TextField(
                       controller: _passwordcontroller,
                       obscureText: true,
                       decoration: InputDecoration(

                           border: InputBorder.none,
                           hintText: 'Password'
                       ),
                     ),
                   ),
                 ),
               ),
               SizedBox(
                 height:
                 10.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 child: Container(

                 padding: EdgeInsets.all(20.0),
                 decoration: BoxDecoration(
                   color: Colors.deepPurple,
                   borderRadius: BorderRadius.circular(12.0),
                 ),
                 child: TextButton(
                   onPressed: (){
                     scannedtext = "";
                     Navigator.push(
                         context, MaterialPageRoute(builder: (context) => screen2()));
                   },
                   child: Text('Login',
                 style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18.0),),
               ),),),
               SizedBox(
                 height: 10.0,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center ,
                 children: [
                   Text('Not a member? ',
                   style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                   Text('Register now',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                 ],
               )
             ],
           ),
         ),
       )
     ),


    );
  }


}
