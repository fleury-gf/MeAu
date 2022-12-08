import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget {
  const StandardButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}

class TextOnlyButton extends StatelessWidget {
  const TextOnlyButton(
      {super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
      child: TextButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}
