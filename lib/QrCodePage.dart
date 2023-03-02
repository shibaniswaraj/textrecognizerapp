
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:textrecognizer/screen2.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code"),
      ),
      body: Center(

        child: InteractiveViewer(
          minScale: 1,
          maxScale: 3,
          child: Container(
            color: Colors.grey[300],//Color(0xFFFFE7ED),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            child: QrImage(
              backgroundColor: Colors.white,
              data: scannedtext,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}