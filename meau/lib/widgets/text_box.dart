import 'package:flutter/material.dart';

class Textbox extends StatelessWidget {
  const Textbox(
      {super.key,
      required this.controller,
      this.isPassword = false,
      this.placeholder = ""});
  final TextEditingController controller;
  final bool isPassword;
  final String placeholder;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(hintText: placeholder),
    );
  }
}
