import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meau/models/pet_model.dart';
import 'package:meau/models/user_model.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meau/api/user_functions.dart';
import 'package:meau/models/user_model.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.pet,
    this.isOwner = false,
  });

  // const UserPetCard({
  //   super.key,
  //   required this.CurrentUserData,
  // });

  final PetModel pet;
  final bool isOwner;

  @override
  Widget build(BuildContext context) {
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
            children: [
              // isOwner
              //     ? pet.hasInterest
              //         ? IconButton(
              //             onPressed: () {
              //               log("toggle interest");
              //             },
              //             icon: const Icon(
              //               Icons.error,
              //               size: 24,
              //             ),
              //           )
              //         : const SizedBox(
              //             height: 42,
              //           )
              //     : IconButton(
              //         onPressed: () {
              //           log("toggle favorite");
              //         },
              //         icon: const Icon(
              //           Icons.favorite_outline,
              //           size: 24,
              //         ),
              //       ),
            ],
          ),
        ),
        SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.memory(base64Decode(pet.picture), fit: BoxFit.fill)),
        Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: isOwner
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: isOwner
                    ? [
                        Text(
                          "0 NOVOS INTERESSADOS",
                        )
                      ]
                    : [
//                         ElevatedButton.icon(
//                             onPressed: () {
//                               // Navigator.of(context).pop(),
//                               // Navigator.of(context).pop();

// showDialog(context: context, builder: (BuildContext context){
//     return AlertDialog(
//       title: Text("Success"),
//       content: Text("Saved successfully")
//     );
// };)

//                             },
//                             icon: Icon(
//                               Icons.favorite,
//                               size: 20.0,
//                             ),
//                             label: Text("Adotar")),

                        ElevatedButton.icon(
                          onPressed: () {
                            showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: MaterialLocalizations.of(context)
                                    .modalBarrierDismissLabel,
                                barrierColor: Colors.black45,
                                transitionDuration:
                                    const Duration(milliseconds: 200),
                                pageBuilder: (BuildContext context,
                                    Animation animation,
                                    Animation secondaryAnimation) {
                                  return Center(
                                      child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 30,
                                    height:
                                        MediaQuery.of(context).size.height - 70,
                                    padding: EdgeInsets.all(20),
                                    color: Colors.white,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          DefaultTextStyle(
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 7, 1, 0),
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
                                                        base64Decode(
                                                            pet.picture),
                                                        fit: BoxFit.fill)),
                                                Text("Nome: " + pet.nome),
                                                Divider(),
                                                Text("Especie: " + pet.especie),
                                                Divider(),
                                                Text("Sexo: " + pet.sexo),
                                                Divider(),
                                                Text("Porte: " + pet.porte),
                                                Divider(),
                                                Text("Idade: " + pet.idade),
                                                Divider(),
                                                Text("Temperamento: " +
                                                    pet.temperamento),
                                                Divider(),
                                                Text("Saude: " + pet.saude),
                                                Divider(),
                                                Text("Doencas: " + pet.doencas),
                                                Divider(),
                                                Text("Exigencias: " +
                                                    pet.exigencias),
                                                Divider(),
                                                Text("Sobre: " + pet.sobre),
                                                // Text("OwnerId: " + pet.ownerId)
                                              ],
                                            ),
                                          ),
                                          ElevatedButton(
                                              child: Text("Adotar"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                createAdoptionRequest(
                                                    pet.id,
                                                    pet.ownerId,
                                                    pet.nome,
                                                    // CurrentUserData.nome,
                                                    FirebaseAuth.instance
                                                        .currentUser!.uid);
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text("Adoção"),
                                                        content: Text(
                                                            "Pedido de adoção Enviado!!!"),
                                                      );
                                                    });
                                              }),
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
                          label: Text(pet.nome),
                        ),
                        Text(
                          pet.sexo.toUpperCase(),
                        ),
                        Text(
                          pet.idade.toUpperCase(),
                        ),
                        Text(
                          pet.porte.toUpperCase(),
                        ),
                      ],
              ),
              // isOwner
              //     ? Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             "ADOÇÃO",
              //           )
              //         ],
              //       )
              //     : Text(
              //         "pet.userAddress.toUpperCase()",
              //       ),
            ],
          ),
        ),
      ]),
    );
  }
}

Future<String> createAdoptionRequest(
    String pet_id, String owner_id, String pet_name, String person_id) async {
  try {
    await FirebaseFirestore.instance.collection("adoption_request").doc().set({
      "pet_id": pet_id,
      "owner_id": owner_id,
      "pet_nome": pet_name,
      "person_id": person_id
    });
  } on FirebaseException catch (e) {
    return e.code;
  }
  return "";
}
