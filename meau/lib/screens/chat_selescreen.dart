import 'package:flutter/material.dart';
import '../api/pet_functions.dart';
import '../models/pet_model.dart';
import '../models/user_model.dart';
import '../widgets/adoption_request_card.dart';

import '../widgets/chat_selecard.dart';
import '../widgets/screen_template.dart';

class ChatSelectScreen extends StatefulWidget {
  const ChatSelectScreen({super.key, required this.user});
  final UserModel user;
  @override
  State<ChatSelectScreen> createState() => _ChatSelectScreenState();
}

class _ChatSelectScreenState extends State<ChatSelectScreen> {
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
      title: "Conversas",
      children: [
        Column(
          children: requests
              .map((request) => ChartSelectCard(request: request))
              .toList(),
        ),
      ],
    );
  }
}
