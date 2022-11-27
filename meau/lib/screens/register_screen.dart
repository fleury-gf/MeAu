import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/main_title.dart';
import 'package:meau/widgets/text_box.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TELA DE REGISTRO")),
      drawer: Drawer(),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Textbox(
                  controller: usernameController,
                  placeholder: "nome de usuário"),
              Textbox(
                controller: passwordController,
                placeholder: "senha",
                isPassword: true,
              ),
              Textbox(
                controller: emailController,
                placeholder: "email",
              ),
              StandardButton(
                buttonText: "CADASTRAR",
                onPressed: () => {log(passwordController.text)},
              )
            ],
          ),
        ),
      ),
    );
  }
}
