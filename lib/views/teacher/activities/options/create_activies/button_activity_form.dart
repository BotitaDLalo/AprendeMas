import 'package:flutter/material.dart';

class ButtonActivityForm extends StatelessWidget {
  final String buttonName;
  final VoidCallback onPressed;

  const ButtonActivityForm(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // border radius
          ),
        ),
        onPressed: onPressed,
        child: Text(buttonName));
  }
}
