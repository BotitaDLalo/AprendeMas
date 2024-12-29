import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:flutter/material.dart';

class ActivityBodyModel extends StatelessWidget {
  final String nombreActividad;
  final DateTime fechaCreacion;
  final DateTime fechaLimite;
  final String descripcion;
  final int subjectId;

  const ActivityBodyModel({
    super.key, 
    required this.nombreActividad,
    required this.fechaCreacion, 
    required this.fechaLimite, 
    required this.descripcion, 
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomContainerStyle(
        height: 250,
        width: double.infinity,
        color: Colors.white,
        borderColor: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.assignment_outlined,
                  size: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombreActividad, // Nombre dinámico
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      'Publicado: $fechaCreacion',
                      style: const TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
               Column(
        children: [
          const Text(
            'Fecha de entrega :',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          Text(
            '$fechaLimite', // Fecha límite dinámica
            style: const TextStyle(fontSize: 8),
          )
        ],
      ) // Fecha límite
              ],
            ),
            const _CustomDivider(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$descripcion', // Descripción dinámica
                style: const TextStyle(fontSize: 10),
              ),
            ), // Descripción dinámica
            const _CustomDivider(),
            const Text(
              'Ver Completo',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}