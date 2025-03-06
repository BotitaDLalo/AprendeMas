import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;
  const ButtonLogin(
      {super.key, this.text, this.textColor, this.buttonStyle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: buttonStyle,
        onPressed: onPressed,
        child: Text(
          text ?? "",
          style: TextStyle(color: textColor, fontSize: 18),
        ));
  }
}
