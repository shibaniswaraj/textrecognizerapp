import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import "./login.dart";
import "./googleSearch.dart";

//commented the ui code to test login page
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //comment this code

      home: Login(),
      // theme: ThemeData(
      //     colorScheme: ColorScheme.light().copyWith(
      //       primary: Color(0xFFFFE7ED),
      //     ),
      //     scaffoldBackgroundColor: Colors.white //Color(0xFF11061B),
      //     ),
      // home: DefaultTabController(
      //   length: 3,
      //   child: Scaffold(
      //     appBar: AppBar(
      //       //toolbarHeight: 140.0,
      //       elevation: 2.0,
      //       shadowColor: Colors.black,
      //       title: Text(
      //         "Textagram",
      //         textAlign: TextAlign.left,
      //         style: TextStyle(
      //             fontFamily: 'RubikVinyl',
      //             fontSize: 30.0,
      //             color: Colors.black),
      //       ),
      //       bottom: TabBar(
      //         unselectedLabelColor: Color(0xFF2F002C),
      //         labelColor: Color(0xFF8F09A2),
      //         tabs: [
      //           Tab(
      //             text: "Scan",
      //           ),
      //           Tab(
      //             text: "History",

      //             //style: TextStyle(color: Colors.black, fontSize: 20.0),
      //           ),
      //           Tab(
      //             text: "Search on Google",
      //           )
      //         ],
      //       ),
      //     ),
      //     body: SafeArea(
      //         child: Column(
      //       //mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Center(
      //           child: Container(
      //             //alignment: Alignment.center,
      //             margin: EdgeInsets.only(left: 10.0, top: 60.0),
      //             width: 270.0,
      //             height: 270.0,
      //             color: Color(0xFFD9F5FE),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20.0,
      //         ),
      //         Row(
      //           children: [
      //             Container(
      //               width: 270.0,
      //               height: 150.0,
      //               // color: Color(0xFFFFE7ED),
      //               margin: EdgeInsets.only(left: 75.0),
      //               decoration: BoxDecoration(
      //                   color: Color(0xFFFFE7ED),
      //                   borderRadius: BorderRadius.circular(12.0)),
      //             ),
      //             /*SizedBox.expand(
      //               child: DraggableScrollableSheet(
      //                 builder: (BuildContext context,
      //                     ScrollController scrollController) {
      //                   return Container(
      //                     color: Color(0xFFD9F5FE),
      //                     child: ListView.builder(
      //                       controller: scrollController,
      //                       itemCount: 25,
      //                       itemBuilder: (BuildContext context, int index) {
      //                         return ListTile(title: Text('Item $index'));
      //                       },
      //                     ),
      //                   );
      //                 },
      //               ),
      //             ),*/
      //             SizedBox(
      //               width: 16.0,
      //             ),
      //             Container(
      //               //alignment: Alignment.bottomRight,
      //               margin: EdgeInsets.only(top: 62.0),
      //               //height: 350.0,
      //               //width: 55.0,
      //               color: Colors.white, //Color(0xFFD9F5FE),
      //               //child: Column(
      //               //children: [
      //               child: Column(
      //                 children: [
      //                   DecoratedIcon(
      //                     Icons.photo,
      //                     color: Color(0xFFD9F5FE), //Colors.purple,
      //                     size: 50.0,
      //                     shadows: [
      //                       BoxShadow(
      //                         blurRadius: 42.0,
      //                         color: Colors.black,
      //                       ),
      //                       BoxShadow(
      //                         blurRadius: 12.0,
      //                         color: Colors.white,
      //                       ),
      //                     ],
      //                   ),

      //                   /*Icon(
      //                   Icons.photo,
      //                   color: Colors.blueAccent,
      //                 ),*/
      //                   SizedBox(
      //                     height: 32.0,
      //                   ),
      //                   DecoratedIcon(
      //                     Icons.camera_alt,
      //                     color: Color(0xFFD9F5FE),
      //                     size: 50.0,
      //                     shadows: [
      //                       BoxShadow(
      //                         blurRadius: 42.0,
      //                         color: Colors.black,
      //                       ),
      //                       BoxShadow(
      //                         blurRadius: 12.0,
      //                         color: Colors.white,
      //                       ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     )),
      //   ),
      // ),
    );
  }
}
