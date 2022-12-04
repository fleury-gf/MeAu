import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/screens/home_screen.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';
import 'package:meau/widgets/text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void _handleLogin(BuildContext context) async {
    await signIn(emailcontroller.text, passwordcontroller.text);
    if (!mounted) return;
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Tela de Login",
      children: <Widget>[
        TextInput(
            controller: emailcontroller,
            placeholder: "email ex:zéwilson@mail.com"),
        TextInput(
          controller: passwordcontroller,
          isPassword: true,
          placeholder: "senha",
        ),
        StandardButton(
            buttonText: "Entrar",
            onPressed: () {
              _handleLogin(context);
            }),
      ],
    );
  }
}
