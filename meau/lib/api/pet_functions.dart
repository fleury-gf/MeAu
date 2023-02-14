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
      pet.picture = doc.get("picture");
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

Future<List<PetModel>> getUserPets(String userid) async {
  List<PetModel> pets = [];

  try {
    QuerySnapshot<Map<String, dynamic>> docsRef = await FirebaseFirestore
        .instance
        .collection("pets")
        .where("ownerId", isEqualTo: userid)
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
      pet.picture = doc.get("picture");
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

Future<String> createAdoptionRequest(
    String pet_id, String owner_id, String pet_name, String person_id) async {
  try {
    QuerySnapshot<Map<String, dynamic>> request = await FirebaseFirestore
        .instance
        .collection("adoption_request")
        .where("pet_id", isEqualTo: pet_id)
        .where("person_id", isEqualTo: person_id)
        .get();
    if (request.docs.isEmpty == true) {
      await FirebaseFirestore.instance
          .collection("adoption_request")
          .doc()
          .set({
        "pet_id": pet_id,
        "owner_id": owner_id,
        "pet_nome": pet_name,
        "person_id": person_id,
        "seen": false
      });
    }
  } on FirebaseException catch (e) {
    return e.code;
  }
  return "";
}

Future<List<AdoptionRequestModel>> getUserRequests(String userid) async {
  List<AdoptionRequestModel> requests = [];

  try {
    QuerySnapshot<Map<String, dynamic>> docsRef = await FirebaseFirestore
        .instance
        .collection("adoption_request")
        .where("owner_id", isEqualTo: userid)
        .get();

    for (var doc in docsRef.docs) {
      AdoptionRequestModel request = AdoptionRequestModel();
      request.request_id = doc.id;
      request.pet_id = doc.get("pet_id");
      request.pet_name = doc.get("pet_nome");
      request.owner_id = doc.get("owner_id");
      request.person_id = doc.get("person_id");
      requests.add(request);
    }
  } catch (e) {
    log(e.toString());
  }

  return requests;
}

Future<String> deleteAdoptionRequest(id) async {
  try {
    await FirebaseFirestore.instance
        .collection("adoption_request")
        .doc(id)
        .delete();
  } on FirebaseException catch (e) {
    return e.code;
  }
  return "Success";
}

Future<String> changePetOwner(pet_id, person_id) async {
  try {
    await FirebaseFirestore.instance
        .collection("pets")
        .doc(pet_id)
        .update({"ownerId": person_id, "isAdopt": false});
  } on FirebaseException catch (e) {
    return e.code;
  }

  return "";
}
