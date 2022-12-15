import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/models/user_model.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';
import 'package:meau/widgets/text_box.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

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

  void _handleRegister(BuildContext context) async {
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
        passwordConfirmController.text,
        base64Image);

    await signUp(newuser);
  }

  //variaveis do armazenamento da imagem
  String base64Image = '';

  ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? image2;

  //Função que pega a foto
  void selecionar_foto(String tipo) async {
    if (tipo == "camera") {
      image = await picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 480,
          maxWidth: 640,
          imageQuality: 30);
      setState(() {});
    }
    if (tipo == "galeria") {
      image = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 480,
          maxWidth: 640,
          imageQuality: 30);
      setState(() {});
    }
    Uint8List imagebytes = await image!.readAsBytes();
    base64Image = base64.encode(imagebytes);
    //print(base64Image);
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

      //seletor de imagem, precisa do dart:io e do image_picker.dart
      Container(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        width: 300,
        alignment: Alignment.topCenter,
        child: Column(children: [
          ElevatedButton.icon(
              onPressed: () async {
                selecionar_foto("camera");
              },
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 24.0,
              ),
              label: Text("Camera")),
          ElevatedButton.icon(
              onPressed: () async {
                selecionar_foto("galeria");
              },
              icon: const Icon(
                Icons.drive_folder_upload,
                size: 24.0,
              ),
              label: Text("Galeria")),
        ]),
      ),

      //Mostrar Foto
      Container(
        padding: EdgeInsets.only(top: 10, left: 60, right: 60),
        child: Column(children: [
          image == null ? Container() : Image.file(File(image!.path)),
          image == null ? Container() : Text("Foto Base64:"),
          image == null ? Container() : Image.memory(base64Decode(base64Image))
        ]),
      ),

      StandardButton(
        buttonText: "CADASTRAR",
        onPressed: () {
          _handleRegister(context);
        },
      )
    ]);
  }
}
