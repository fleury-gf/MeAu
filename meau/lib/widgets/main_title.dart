import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key, this.title = "DAS"});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 56, 0, 0),
      child: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
