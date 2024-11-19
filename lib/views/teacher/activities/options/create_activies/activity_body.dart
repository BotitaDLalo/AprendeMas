import 'package:aprende_mas/models/activities/activity/activity.dart';
import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class ActivityBody extends StatelessWidget {
  final Activity activity;

  const ActivityBody({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return CustomContainerStyle(
      height: 250,
      width: double.infinity,
      color: Colors.white,
      borderColor: Colors.blue,
      child: Column(
        children: [
          _DateBody(activity: activity), // Fechas dinámicas
          const _CustomDivider(),
          _Description(
              description: activity.descripcion), // Descripción dinámica
          const _CustomDivider(),
          const Text(
            'Ver Completo',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String description;

  const _Description({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        description, // Descripción dinámica
        style: const TextStyle(fontSize: 10),
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

class _DateBody extends StatelessWidget {
  final Activity activity;

  const _DateBody({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Icon(
            Icons.assignment_outlined,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          _ActivityDates(activity: activity), // Fechas de publicación
          const SizedBox(
            width: 70,
          ),
          _DeliveryDate(fechaLimite: activity.fechaLimite), // Fecha límite
        ],
      ),
    );
  }
}

class _ActivityDates extends StatelessWidget {
  final Activity activity;

  const _ActivityDates({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          activity.nombre, // Nombre dinámico
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          'Publicado: ${DateFormat('dd/MM/yyyy HH:mm').format(activity.fechaCreacion)}',
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );
  }
}

class _DeliveryDate extends StatelessWidget {
  final DateTime fechaLimite;

  const _DeliveryDate({required this.fechaLimite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Fecha de entrega :',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          DateFormat('dd/MM/yyyy HH:mm')
              .format(fechaLimite), // Fecha límite dinámica
          style: const TextStyle(fontSize: 8),
        )
      ],
    );
  }
}