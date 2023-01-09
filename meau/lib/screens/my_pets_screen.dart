import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api/pet_functions.dart';
import '../models/pet_model.dart';
import '../widgets/screen_template.dart';

class MyPetsScreen extends StatefulWidget {
  const MyPetsScreen({super.key});

  @override
  State<MyPetsScreen> createState() => _MyPetsScreenState();
}

class _MyPetsScreenState extends State<MyPetsScreen> {
  List<PetModel> pets = [];
  @override
  void initState() {
    setPets();
    super.initState();
  }

  void setPets() async {
    List<PetModel> petsaux =
        await getUserPets(FirebaseAuth.instance.currentUser!.uid);
    setState(() {
      pets = petsaux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(children: pets.map((pet) => Text(pet.id)).toList());
  }
}
