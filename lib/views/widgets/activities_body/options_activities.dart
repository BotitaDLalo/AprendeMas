import 'package:flutter/material.dart';

class OptionsActivities extends StatelessWidget {
  const OptionsActivities({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {}, child: const Text('Avisos')),
        TextButton(onPressed: () {}, child: const Text('Actividades')),
        TextButton(onPressed: () {}, child: const Text('Alumnos')),
        TextButton(onPressed: () {}, child: const Text('Calificaciones')),
      ],
    );
  }
}