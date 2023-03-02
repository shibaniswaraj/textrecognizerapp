import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'QrCodePage.dart';
import 'screen2.dart';
import 'dart:ui';







class text extends StatefulWidget {
  const text({Key? key}) : super(key: key);

  @override
  State<text> createState() => _textState();
}



class _textState extends State<text> {
  @override

  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
            elevation: 2.0,
            shadowColor: Colors.black,
            title: const Text(
              "Textagram",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'RubikVinyl',
                  fontSize: 30.0,
                  color: Colors.black),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    String url = "https://www.google.com/search?q=$scannedtext";
                    launchUrlString(url);
                  },
                  child:
                  const Text('Google Search', style: TextStyle(color: Color(0xFF2F002C)))
              )
            ],
          ),
          body: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFFFE7ED),
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
            //child: Expanded(
              child: ListView(
                children:[ Text(scannedtext, style: TextStyle(color: Colors.black, fontSize: 20.0),) ]//!= "" ? Text(scannedtext, style: TextStyle(color: Colors.black, fontSize: 20.0),):Text("Upload image with text first.", style: TextStyle(color: Colors.red, fontSize: 20.0),),
              ),
            ),
          floatingActionButton: Stack(
            children: [
              Positioned(
                bottom: 80.0,
                right: 16.0,
                child: FloatingActionButton.extended(
                  label: Text("Copy to Clipboard"),
                  icon: Icon(Icons.copy),
                  backgroundColor: Colors.deepPurple,
                  focusColor: Colors.white,
                  splashColor: Colors.white ,
                  foregroundColor: Colors.white,
                  hoverColor: Colors.white,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: scannedtext));
                  },
                ),
              ),
              Positioned(
                bottom: 16.0,
                right: 16.0,
                child: FloatingActionButton.extended(
                  label: Text("Generate QR Code"),
                  icon: Icon(Icons.qr_code),
                  backgroundColor: Colors.deepPurple,
                  focusColor: Colors.white,
                  splashColor: Colors.white ,
                  foregroundColor: Colors.white,
                  hoverColor: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => QrCodePage()));
                  },
                ),
              ),

            ],
          ),
          // floatingActionButton:
          // FloatingActionButton(
          //   onPressed: () {
          //     Clipboard.setData(ClipboardData(text: scannedtext));
          //   },
          //   child:
          //     Icon(Icons.copy,
          //     color: Colors.red,
          //     ),
          //   backgroundColor: Color(0xFFFFE7ED),
          // ),

        )
    );
  }

}

