import 'package:flutter/material.dart';

class InputNull extends StatelessWidget {

  const InputNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, top: 5.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: 'Generar aviso',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 50),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}