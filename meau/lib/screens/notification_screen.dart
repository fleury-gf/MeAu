import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../api/pet_functions.dart';
import '../api/user_functions.dart';
import '../models/pet_model.dart';
import '../models/user_model.dart';
import '../widgets/adoption_request_card.dart';
import '../widgets/pet_card.dart';
import '../widgets/screen_template.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key, required this.user});
  final UserModel user;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<AdoptionRequestModel> requests = [];
  @override
  void initState() {
    setRequests();
    super.initState();
  }

  void setRequests() async {
    List<AdoptionRequestModel> requestsaux =
        await getUserRequests(widget.user.id);
    setState(() {
      requests = requestsaux;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
      title: "Meus requests",
      children: [
        Column(
          children: requests
              .map((request) => AdoptionRequestCard(request: request))
              .toList(),
        ),
      ],
    );
  }
}
