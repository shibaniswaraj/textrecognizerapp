// ignore: avoid_web_libraries_in_flutter
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool textScanning = false;
  File? pickedImage;
  bool isPicked = false;
  String scannedText = "";
  ImagePicker picker = ImagePicker();
  File? selectedImage;

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
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            //toolbarHeight: 140.0,
            elevation: 2.0,
            shadowColor: Colors.black,
            title: Text(
              "Textagram",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'RubikVinyl',
                  fontSize: 30.0,
                  color: Colors.black),
            ),
            bottom: TabBar(
              unselectedLabelColor: Color(0xFF2F002C),
              labelColor: Color(0xFF8F09A2),
              tabs: [
                Tab(
                  text: "Scan",
                ),
                Tab(
                  text: "History",

                  //style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
                Tab(
                  text: "Search on Google",
                )
              ],
            ),
          ),
          body: SafeArea(
              child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(
                child: pickedImage != null ? Image.file(pickedImage!, width:270.0, height:270.0, fit:BoxFit.contain): Container(
                  //alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 10.0, top: 60.0),
                  width: 270.0,
                  height: 270.0,
                  color: Color(0xFFD9F5FE),
                ),

              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Container(
                    width: 270.0,
                    height: 150.0,
                    // color: Color(0xFFFFE7ED),
                    margin: EdgeInsets.only(left: 75.0),
                    decoration: BoxDecoration(
                        color: Color(0xFFFFE7ED),
                        borderRadius: BorderRadius.circular(12.0)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(scannedText))
                  ),
                  /*SizedBox.expand(
                    child: DraggableScrollableSheet(
                      builder: (BuildContext context,
                          ScrollController scrollController) {
                        return Container(
                          color: Color(0xFFD9F5FE),
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(title: Text('Item $index'));
                            },
                          ),
                        );
                      },
                    ),
                  ),*/
                  SizedBox(
                    width: 16.0,
                  ),
                  Container(
                    //alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(top: 62.0),
                    //height: 350.0,
                    //width: 55.0,
                    color: Colors.white, //Color(0xFFD9F5FE),
                    //child: Column(
                    //children: [
                    child: Column(
                      children: [
                        IconButton(
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              final File image =
                              await ImagePicker.pickImage(source: ImageSource.camera);
                              if (image != null) {
                                pickedImage = File(image.path);
                                setState(() {
                                  isPicked = true;
                                });
                                getText(image);
                              }
                            },
                          icon: const Icon(Icons.camera_alt,
                          )
                        ),
                        SizedBox(
                          width: 16.0,
                          height: 16.0,
                        ),
                        IconButton(
                            onPressed: () async {
                              final ImagePicker _picker = ImagePicker();
                              final File image =
                              await ImagePicker.pickImage(source: ImageSource.gallery);
                              if (image != null) {
                                pickedImage = File(image.path);
                                setState(() {
                                  isPicked = true;
                                });
                                getText(image);
                              }
                              else {
                                return;
                              }
                            },
                            icon: const Icon(Icons.image,
                            )
                        )

                        /*Icon(
                        Icons.photo,
                        color: Colors.blueAccent,
                      ),*/

                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
  void getText(File img) async {
    final inputImage = InputImage.fromFilePath(img.path);
    final textDetector = GoogleMlKit.vision.textDetector();
    RecognisedText recognisedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    scannedText = "";
    for(TextBlock block in recognisedText.blocks) {
      for(TextLine line in block.lines) {
        scannedText = scannedText + line.text + "\n";

      }
    }
    textScanning = false;
    setState(() { });
  }

}

