import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api/pet_functions.dart';
import '../models/pet_model.dart';
import '../models/user_model.dart';
import '../widgets/pet_card.dart';
import '../widgets/screen_template.dart';

class MyPetsScreen extends StatefulWidget {
  const MyPetsScreen({super.key, required this.user});
  final UserModel user;
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
    List<PetModel> petsaux = await getUserPets(widget.user.id);
    setState(() {
      pets = petsaux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Adotar",
      children: [
        Column(
          children: pets.map((pet) => PetCard(pet: pet)).toList(),
        ),
      ],
    );
  }
}
