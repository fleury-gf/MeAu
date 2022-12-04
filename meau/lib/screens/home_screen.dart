import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/screens/register_screen.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    log(isLoggedIn().toString());
    return ScreenTemplate(children: <Widget>[
      StandardButton(
          buttonText: "Registro",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterScreen(),
                ));
          }),
      StandardButton(
          buttonText: "Login",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          }),
      StandardButton(
        buttonText: "Logout",
        onPressed: () async {
          await signOut();
          if (!mounted) return;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
        },
      ),
    ]);
  }
}
