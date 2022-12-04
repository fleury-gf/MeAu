import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/models/user_model.dart';
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
  final nameController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final adressController = TextEditingController();
  final ageController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final phoneController = TextEditingController();

  void _handleRegister() async {
    CreateUserModel newuser = CreateUserModel(
        nameController.text,
        ageController.text,
        emailController.text,
        stateController.text,
        cityController.text,
        adressController.text,
        phoneController.text,
        usernameController.text,
        passwordController.text,
        passwordConfirmController.text);

    await signUp(newuser);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(title: "Tela de Registro", children: <Widget>[
      TextInput(controller: nameController, placeholder: "Nome Completo"),
      TextInput(controller: ageController, placeholder: "Idade"),
      TextInput(controller: emailController, placeholder: "E-mail"),
      TextInput(controller: stateController, placeholder: "Estado"),
      TextInput(controller: cityController, placeholder: "Cidade"),
      TextInput(controller: adressController, placeholder: "Endereço"),
      TextInput(controller: phoneController, placeholder: "Telefone"),
      TextInput(controller: usernameController, placeholder: "Nome de Usuário"),
      TextInput(
        controller: passwordController,
        placeholder: "Senha",
        isPassword: true,
      ),
      TextInput(
        controller: passwordConfirmController,
        placeholder: "Confirmação de senha",
        isPassword: true,
      ),
      StandardButton(
        buttonText: "CADASTRAR",
        onPressed: _handleRegister,
      )
    ]);
  }
}
