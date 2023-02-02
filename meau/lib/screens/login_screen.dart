import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/screens/home_screen.dart';
import 'package:meau/widgets/buttons.dart';
import 'package:meau/widgets/screen_template.dart';
import 'package:meau/widgets/text_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void AdoptionNotification(BuildContext context) async {
  try {
    NavigatorState navigator = Navigator.of(context);
    String pets = '';
    String current_user_id = FirebaseAuth.instance.currentUser!.uid;
    print("achado " + current_user_id);
    int quantidade = 0;
    QuerySnapshot<Map<String, dynamic>> docsRef = await FirebaseFirestore
        .instance
        .collection("adoption_request")
        .where("owner_id", isEqualTo: current_user_id)
        .where("seen", isEqualTo: false)
        .get();

    for (var doc in docsRef.docs) {
      quantidade = quantidade + 1;
      pets = pets + doc.get("pet_nome") + ", ";
    }
    pets = pets.replaceRange(pets.length - 2, null, ".");

    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () async {
        for (var doc in docsRef.docs) {
          await FirebaseFirestore.instance
              .collection("adoption_request")
              .doc(doc.id)
              .update({"seen": true});
        }
        navigator.pop();
      },
    );

    if (quantidade > 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Pedido de Adoção"),
              content: Text("Animais: " + pets),
              actions: [
                okButton,
              ],
            );
          });
    }
  } catch (e) {
    log(e.toString());
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  void _handleLogin(BuildContext context) async {
    await signIn(emailcontroller.text, passwordcontroller.text);
    if (!mounted) return;
    Navigator.pop(context);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
    AdoptionNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Tela de Login",
      children: <Widget>[
        TextInput(
            controller: emailcontroller,
            placeholder: "email ex:zéwilson@mail.com"),
        TextInput(
          controller: passwordcontroller,
          isPassword: true,
          placeholder: "senha",
        ),
        StandardButton(
            buttonText: "Entrar",
            onPressed: () {
              _handleLogin(context);
            }),
      ],
    );
  }
}
