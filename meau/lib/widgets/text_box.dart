import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput(
      {super.key,
      required this.controller,
      this.isPassword = false,
      this.placeholder = ""});
  final TextEditingController controller;
  final bool isPassword;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(hintText: placeholder),
      ),
    );
  }
}
