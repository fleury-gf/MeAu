import 'dart:developer';

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

Future<List<PetModel>> getAllPetsForAdoption() async {
  List<PetModel> pets = [];

  try {
    QuerySnapshot<Map<String, dynamic>> docsRef = await FirebaseFirestore
        .instance
        .collection("pets")
        .where("isAdopt", isEqualTo: true)
        .get();

    for (var doc in docsRef.docs) {
      PetModel pet = PetModel();

      pet.id = doc.id;
      pet.nome = doc.get("nome");
      pet.especie = doc.get("especie");
      pet.sexo = doc.get("sexo");
      pet.porte = doc.get("porte");
      pet.idade = doc.get("idade");
      pet.temperamento = doc.get("temperamento");
      pet.saude = doc.get("saude");
      pet.exigencias = doc.get("exigencias");
      pet.sobre = doc.get("sobre");
      pet.ownerId = doc.get("ownerId");
      pet.isAdopt = doc.get("isAdopt");
      pet.isFoster = doc.get("isFoster");
      pet.isHelp = doc.get("isHelp");

      pets.add(pet);
    }
  } catch (e) {
    log(e.toString());
  }

  for (var pet in pets) {
    log(pet.id);
  }

  return pets;
}
