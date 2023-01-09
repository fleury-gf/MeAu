import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meau/api/pet_functions.dart';
import 'package:meau/models/pet_model.dart';
import 'package:meau/widgets/screen_template.dart';

class AdoptScreen extends StatefulWidget {
  const AdoptScreen({super.key});

  @override
  State<AdoptScreen> createState() => _AdoptScreenState();
}

class _AdoptScreenState extends State<AdoptScreen> {
  List<PetModel> pets = [];
  @override
  void initState() {
    setPets();
    super.initState();
  }

  void setPets() async {
    List<PetModel> petsaux = await getAllPetsForAdoption();
    setState(() {
      pets = petsaux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(children: pets.map((pet) => Text(pet.id)).toList());
  }
}
