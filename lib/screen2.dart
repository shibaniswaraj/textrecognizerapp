import 'dart:io';
import 'text.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'main.dart';
import 'package:flutter/material.dart';
import 'package:decorated_icon/decorated_icon.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}
String scannedtext = "";
class _Screen2State extends State<Screen2> {
  bool textscanning = false;
  File? pickedimage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          //toolbarHeight: 140.0,
          elevation: 2.0,
          shadowColor: Colors.black,
          title: Text(
            "Textagram",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'RubikVinyl', fontSize: 30.0, color: Colors.black),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => text()));
              },
              child: Text(
                'Scan',
                style: TextStyle(color: Color(0xFF2F002C)),
              ),
            )
          ],
          bottom: TabBar(
            unselectedLabelColor: Color(0xFF2F002C),
            labelColor: Color(0xFF8F09A2),
            tabs: [
              Tab(
                text: "Photo",
              ),
              /*Tab(
                text: "Scan",

                //style: TextStyle(color: Colors.black, fontSize: 20.0),
              ),*/
              Tab(
                text: "History",
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!textscanning && pickedimage == null)
                  Container(
                    //alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 66.0),
                    width: 270.0,
                    height: 460.0,
                    color: Color(0xFFD9F5FE),
                  ),
                if (pickedimage != null)
                  Image.file(pickedimage!,
                      width: 270.0, height: 460.0, fit: BoxFit.fitWidth),
                //Image.file(File(imageFile!.path,
                // width: 270.0, height: 250.0, fit: BoxFit.contain)),

                /*SizedBox(
              height: 20.0,
            ),*/
                /*Row(
              children: [
                Container(
                  width: 270.0,
                  height: 150.0,
                  // color: Color(0xFFFFE7ED),
                  margin: EdgeInsets.only(left: 75.0),
                  decoration: BoxDecoration(
                      color: Color(0xFFFFE7ED),
                      borderRadius: BorderRadius.circular(12.0)),
                ),*/
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
                //SizedBox(
                //width: 10.0,
                //),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(top: 400.0, left: 20.0),
                  height: 350.0,
                  width: 55.0,
                  color: Colors.white,
                  //Color(0xFFD9F5FE),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          try {
                            final XFile? image = await _picker.pickImage(
                              source: ImageSource.gallery,
                            );
                            if (image != null) {
                              textscanning = true;
                              pickedimage = File(image.path);

                              setState(() {});
                              // final File? imagefile=File(imageFile!.path),
                            }
                          } catch (e) {
                            textscanning = false;
                            pickedimage = null;
                            setState(() {});
                            scannedtext = "Error occurred while scanning";
                          }
                          setState(() {
                            scannedtext = "";
                            getRecognizedText(pickedimage!);
                          });
                        },
                        iconSize: 45.0,
                        icon: DecoratedIcon(
                          Icons.photo,
                          color: Color(0xFFD9F5FE), //Colors.purple,
                          //size: 30.0,
                          shadows: [
                            BoxShadow(
                              blurRadius: 42.0,
                              color: Colors.black,
                            ),
                            BoxShadow(
                              blurRadius: 12.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),

                      /*Icon(
                        Icons.photo,
                        color: Colors.blueAccent,
                      ),*/
                      SizedBox(
                        height: 32.0,
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            final XFile? image = await _picker.pickImage(
                              source: ImageSource.camera,
                            );
                            if (image != null) {
                              textscanning = true;
                              pickedimage = File(image.path);

                              setState(() {});
                              // final File? imagefile=File(imageFile!.path),
                            }
                          } catch (e) {
                            textscanning = false;
                            pickedimage = null;
                            setState(() {});
                            scannedtext = "Error occurred while scanning";
                          }
                          setState(() {
                            scannedtext = "";
                            getRecognizedText(pickedimage!);
                          });
                        },
                        iconSize: 45.0,
                        icon: DecoratedIcon(
                          Icons.camera_alt,
                          color: Color(0xFFD9F5FE),
                          // size: 50.0,
                          shadows: [
                            BoxShadow(
                              blurRadius: 42.0,
                              color: Colors.black,
                            ),
                            BoxShadow(
                              blurRadius: 12.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ],
                  //),//
                ),
              ],
            )),
      ),
    );
  }

  Future<void> getRecognizedText(File img) async {
    final inputImage = InputImage.fromFile(img);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(inputImage);
    await textDetector.close();
    for (TextBlock block in recognizedText.blocks) {
      for (TextLine line in block.lines) {
        scannedtext = scannedtext + " " + line.text + "\n";
      }
    }
    textscanning = false;
    setState(() {});
  }

}
