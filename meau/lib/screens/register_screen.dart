import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';
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
    return ScreenTemplate(title: "Tela de Registro", children: <Widget>[
      TextInput(controller: usernameController, placeholder: "nome de usuário"),
      TextInput(
        controller: passwordController,
        placeholder: "senha",
        isPassword: true,
      ),
      TextInput(
        controller: emailController,
        placeholder: "email",
      ),
      StandardButton(
        buttonText: "CADASTRAR",
        onPressed: () => {log(passwordController.text)},
      )
    ]);
  }
}
