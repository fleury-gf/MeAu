import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pet_model.dart';

Future<String> createPet(CreatePetModel pet) async {
  try {
    await FirebaseFirestore.instance.collection("pets").doc().set({
      "nome": pet.nome,
      "especie": pet.especie,
      "sexo": pet.sexo,
      "porte": pet.porte,
      "idade": pet.idade,
      "temperamento": pet.temperamento,
      "saude": pet.saude,
      "exigencias": pet.exigencias,
      "sobre": pet.sobre,
      "ownerId": pet.ownerId,
      "isAdopt": pet.isAdopt,
      "isFoster": pet.isFoster,
      "isHelp": pet.isHelp,
      "picture": pet.picture,
    });
  } on FirebaseException catch (e) {
    return e.code;
  }

  return "";
}
