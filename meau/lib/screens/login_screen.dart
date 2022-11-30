import 'dart:developer';
import 'package:flutter/cupertino.dart';
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
  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Tela de Login",
      children: <Widget>[
        TextInput(
            controller: emailcontroller,
            placeholder: "email ex:wilson@gmail.com"),
        TextInput(
          controller: passwordcontroller,
          isPassword: true,
          placeholder: "senha",
        ),
        StandardButton(
            buttonText: "Entrar",
            onPressed: () {
              log(emailcontroller.text);
            }),
      ],
    );
  }
}
