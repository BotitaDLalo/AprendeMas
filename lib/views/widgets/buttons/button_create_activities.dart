import 'package:flutter/material.dart';

class ButtonCreateActvities extends StatelessWidget {
  const ButtonCreateActvities({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: FilledButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.blue), 
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )),
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40))
          ), 
          child: const Text('Crear'),
        )),
    );
  }
}