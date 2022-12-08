import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/screens/register_screen.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';

import 'login_screen.dart';

class LoginTreeScreen extends StatefulWidget {
  const LoginTreeScreen({super.key});

  @override
  State<LoginTreeScreen> createState() => _LoginTreeScreenState();
}

class _LoginTreeScreenState extends State<LoginTreeScreen> {
  @override
  Widget build(BuildContext context) {
    log(isLoggedIn().toString());
    return ScreenTemplate(children: <Widget>[
      StandardButton(
          buttonText: "FAZER CADASTRO",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ));
          }),
      StandardButton(
          buttonText: "FAZER LOGIN",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }),
    ]);
  }
}
