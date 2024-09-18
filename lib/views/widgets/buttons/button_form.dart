import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const ButtonForm(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF212B40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // border radius
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
