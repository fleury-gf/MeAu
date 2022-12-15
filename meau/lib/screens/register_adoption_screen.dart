import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meau/api/pet_functions.dart';
import 'package:meau/models/pet_model.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/radio.dart';
import 'package:meau/widgets/screen_template.dart';
import 'package:meau/widgets/text_box.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

class RegisterAdoptionScreen extends StatefulWidget {
  const RegisterAdoptionScreen({super.key});

  @override
  State<RegisterAdoptionScreen> createState() => _RegisterAdoptionScreenState();
}

class _RegisterAdoptionScreenState extends State<RegisterAdoptionScreen> {
  String groupValue = "";
  final nameController = TextEditingController();
  String exigencias = "";
  final List<String> exigenciasArray = [
    "Termo de adoção",
    "Fotos da casa",
    "Visita prévia ao animal",
    "Acompanhamento pós adoção",
  ];
  String especie = "";
  final List<String> especieArray = [
    "Cachorro",
    "Gato",
  ];
  String sexo = "";
  final List<String> sexoArray = [
    "Macho",
    "Fêmea",
  ];
  String porte = "";
  final List<String> porteArray = [
    "Pequeno",
    "Médio",
    "Grande",
  ];
  String idade = "";
  final List<String> idadeArray = [
    "Filhote",
    "Adulto",
    "Idoso",
  ];
  String temperamento = "";
  final List<String> temperamentoArray = [
    "Brincalhão",
    "Tímido",
    "Calmo",
    "Guarda",
    "Amoroso",
    "Preguiçoso",
  ];
  String saude = "";
  final List<String> saudeArray = [
    "Vacinado",
    "Vermifugado",
    "Castrado",
    "Doente",
  ];
  final doencasController = TextEditingController();
  final sobreController = TextEditingController();
  final pictureController = TextEditingController();

  bool isAdopt = false;
  bool isFoster = false;
  bool isHelp = false;

  void changeExigencias(String? value) {
    setState(() {
      exigencias = exigenciasArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changeEspecie(String? value) {
    setState(() {
      especie = especieArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changeSexo(String? value) {
    setState(() {
      sexo = sexoArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changePorte(String? value) {
    setState(() {
      porte = porteArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changeIdade(String? value) {
    setState(() {
      idade = idadeArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changeTemperamento(String? value) {
    setState(() {
      temperamento = temperamentoArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void changeSaude(String? value) {
    setState(() {
      saude = saudeArray.firstWhere(
        (element) => element == value,
        orElse: () {
          return "";
        },
      );
    });
  }

  void _handleRegister(BuildContext context) async {
    CreatePetModel newpet = CreatePetModel(
        nameController.text,
        especie,
        sexo,
        porte,
        idade,
        temperamento,
        saude,
        doencasController.text,
        exigencias,
        sobreController.text,
        FirebaseAuth.instance.currentUser!.uid,
        isAdopt,
        isFoster,
        isHelp,
        base64Image);

    await createPet(newpet);
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
    return ScreenTemplate(title: "Cadastro de Adoção", children: <Widget>[
      TextInput(
        controller: nameController,
        placeholder: "Nome do Animal",
      ),
      InputRadio(
          groupValue: especie,
          valueArray: especieArray,
          onChanged: changeEspecie),
      InputRadio(
          groupValue: sexo, valueArray: sexoArray, onChanged: changeSexo),
      InputRadio(
          groupValue: porte, valueArray: porteArray, onChanged: changePorte),
      InputRadio(
          groupValue: idade, valueArray: idadeArray, onChanged: changeIdade),
      InputRadio(
          groupValue: temperamento,
          valueArray: temperamentoArray,
          onChanged: changeTemperamento),
      InputRadio(
          groupValue: saude, valueArray: saudeArray, onChanged: changeSaude),
      TextInput(
        controller: doencasController,
        placeholder: "Doenças do Animal",
      ),
      InputRadio(
          groupValue: exigencias,
          valueArray: exigenciasArray,
          onChanged: changeExigencias),
      TextInput(
        controller: sobreController,
        placeholder: "Sobre",
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
          buttonText: "Cadastrar Animal",
          onPressed: () {
            _handleRegister(context);
          })
    ]);
  }
}
