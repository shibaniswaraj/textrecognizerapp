import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//google search using parameters and url launcher library
class GoogleSearch extends StatelessWidget {
  final String searchText;
  const GoogleSearch({super.key, this.searchText = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text("Google search"),
        onPressed: () {
          String url = "https://www.google.com/search?q=$searchText";
          launch(url);
        },
      ),
    );
  }
}
