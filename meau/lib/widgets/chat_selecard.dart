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

class ChartSelectCard extends StatefulWidget {
  const ChartSelectCard({super.key, required this.request});

  final AdoptionRequestModel request;

  @override
  State<ChartSelectCard> createState() => _ChartSelectCardState();
}

class _ChartSelectCardState extends State<ChartSelectCard> {
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
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.memory(
                        base64Decode(person.picture),
                        height: 40,
                        width: 40,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => chatpage(
                              personid: person.id,
                              senderid: currentUser!.id,
                            ),
                          ));
                    },
                    icon: Icon(
                      Icons.chat,
                      size: 20.0,
                    ),
                    label: Text(person.nome),
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
