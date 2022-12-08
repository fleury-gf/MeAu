import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meau/api/pet_functions.dart';
import 'package:meau/models/pet_model.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/radio.dart';
import 'package:meau/widgets/screen_template.dart';
import 'package:meau/widgets/text_box.dart';

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
        isHelp);

    await createPet(newpet);
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
      StandardButton(
          buttonText: "Cadastrar Animal",
          onPressed: () {
            _handleRegister(context);
          })
    ]);
  }
}
