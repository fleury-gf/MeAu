import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meau/models/pet_model.dart';

class PetCard extends StatelessWidget {
  const PetCard({
    super.key,
    required this.pet,
    this.isOwner = false,
  });

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
              Text(
                pet.nome,
              ),
              isOwner
                  ? pet.hasInterest
                      ? IconButton(
                          onPressed: () {
                            log("toggle interest");
                          },
                          icon: const Icon(
                            Icons.error,
                            size: 24,
                          ),
                        )
                      : const SizedBox(
                          height: 42,
                        )
                  : IconButton(
                      onPressed: () {
                        log("toggle favorite");
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: 24,
                      ),
                    ),
            ],
          ),
        ),
        SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.memory(base64Decode(pet.picture), fit: BoxFit.fill)),
        Container(
          height: 48,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
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
              isOwner
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ADOÇÃO",
                        )
                      ],
                    )
                  : Text(
                      "pet.userAddress.toUpperCase()",
                    ),
            ],
          ),
        ),
      ]),
    );
  }
}
