import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/main_title.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            MainTitle(title: "TELA DE REGISTRO"),
            StandardButton(
              buttonText: "CADASTRAR",
              onPressed: () => {log("registrado pai")},
            )
          ],
        ),
      ),
    );
  }
}
