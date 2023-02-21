import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
            child: Expanded(
              child: SingleChildScrollView(
                child: scannedtext != "" ? Text(scannedtext, style: TextStyle(color: Colors.black, fontSize: 20.0),):Text("Upload image with text first.", style: TextStyle(color: Colors.grey, fontSize: 20.0),),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: scannedtext));
            },
            child:
              Icon(Icons.copy,
              color: Colors.red,
              ),
            backgroundColor: Color(0xFFFFE7ED),
          ),
        )
    );
  }
}

