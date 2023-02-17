import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
// import 'package:textrecognizer/main.dart';
import './authentication/auth.dart';
import 'package:url_launcher/url_launcher.dart';
import "./googleSearch.dart";

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          CompanyTitle(),
          TextInput(),
          RegisterButton(),
        ]),
      ),
    );
  }
}

class CompanyTitle extends StatelessWidget {
  const CompanyTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        const Text("Textagram"),
        const Text("Find any text you want.")
      ],
    ));
  }
}

class TextInput extends StatefulWidget {
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(
              labelText: "Username", border: OutlineInputBorder()),
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
              labelText: "Password", border: OutlineInputBorder()),
        )
      ],
    );
  }
}

class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key});

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  String? errorMessage = "";

  Future<void> createUserWithUsernameAndPassword() async {
    try {
      //signing up code
      await Auth().createUserwithEmailandPassword(
          email: nameController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {});
    }
  }

  Widget _errorMessage() {
    return Text(errorMessage == "" ? '' : "Error message : $errorMessage");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            createUserWithUsernameAndPassword();
          },
          child: Text("Register"),
        ),
        _errorMessage()
      ],
    );
  }
}
