import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meau/api/messages.dart';
import 'package:meau/models/pet_model.dart';
import 'package:meau/models/user_model.dart';
import 'package:meau/api/user_functions.dart';

import '../api/pet_functions.dart';

import '../screens/chatpage.dart';

class AdoptionRequestCard extends StatefulWidget {
  const AdoptionRequestCard({super.key, required this.request});

  final AdoptionRequestModel request;

  @override
  State<AdoptionRequestCard> createState() => _AdoptionRequestCardState();
}

class _AdoptionRequestCardState extends State<AdoptionRequestCard> {
  UserModel person = new UserModel();

  @override
  void initState() {
    setPerson();
    _setCurrentUser();
    super.initState();
  }

  setPerson() async {
    UserModel _person = await getUser(widget.request.person_id);
    setState(() {
      person = _person;
    });
  }

  UserModel? currentUser;

  void _setCurrentUser() async {
    UserModel? user = await getCurrentUser();
    if (user != null) {
      setState(() {
        currentUser = user;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log(person.nome);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.only(top: 16, left: 4, right: 4),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context)
                              .modalBarrierDismissLabel,
                          barrierColor: Colors.black45,
                          transitionDuration: const Duration(milliseconds: 200),
                          pageBuilder: (BuildContext context,
                              Animation animation,
                              Animation secondaryAnimation) {
                            return Center(
                                child: Container(
                              width: MediaQuery.of(context).size.width - 30,
                              height: MediaQuery.of(context).size.height - 70,
                              padding: EdgeInsets.all(20),
                              color: Colors.white,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 7, 1, 0),
                                          fontSize: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height: 200,
                                              width: double.infinity,
                                              child: Image.memory(
                                                  base64Decode(person.picture),
                                                  fit: BoxFit.fill)),
                                          Text("Nome: " + person.nome),
                                          Divider(),
                                          Text("Idade: " + person.idade),
                                          Divider(),
                                          Text("Email: " + person.email),
                                          Divider(),
                                          Text("Estado: " + person.estado),
                                          Divider(),
                                          Text("Cidade: " + person.cidade),
                                          Divider(),
                                          Text("Endereço: " + person.endereco),
                                          Divider(),
                                          Text("Telefone: " + person.telefone),
                                          Divider(),
                                          Text("Username: " + person.username),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    ElevatedButton(
                                        child: Text("Chat"),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => chatpage(
                                                  personid: person.id,
                                                  senderid: currentUser!.id,
                                                ),
                                              ));
                                        }),
                                    Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                            child: Text("Aceitar"),
                                            onPressed: () {
                                              changePetOwner(
                                                  widget.request.pet_id,
                                                  widget.request.person_id);
                                              deleteAdoptionRequest(
                                                  widget.request.request_id);
                                              Navigator.of(context).pop();
                                            }),
                                        SizedBox(width: 30),
                                        ElevatedButton(
                                            child: Text("Recusar"),
                                            onPressed: () {
                                              deleteAdoptionRequest(
                                                  widget.request.request_id);
                                              Navigator.of(context).pop();
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ));
                          });
                    },
                    icon: Icon(
                      Icons.info,
                      size: 20.0,
                    ),
                    label: Text(person.nome),
                  ),
                  Text(
                    "Pet: " + widget.request.pet_name.toUpperCase(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
