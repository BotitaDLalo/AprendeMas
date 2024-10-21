import 'package:aprende_mas/models/models.dart';
import 'package:flutter/material.dart';


class CustomActivitiesContainer extends StatelessWidget {
  final List<Activities>? actividades;
  const CustomActivitiesContainer({super.key, required this.actividades});

  String dateFormat(String date){
    return date.substring(0,10);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: (actividades ?? []).map((actividad) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
          child: Row(
            children: [
            Text(dateFormat(actividad.fechaCreacion)),
            const SizedBox(width: 8, ), 
            Text(actividad.nombreActividad),
            const SizedBox(width: 8, ), 
            ]
          ),
        );
      }).toList(),
    );
  }
}