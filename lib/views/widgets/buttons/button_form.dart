import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;
  final ButtonStyle style;

  const ButtonForm(
      {super.key, required this.buttonName, required this.onPressed, required this.style});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: style,
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
