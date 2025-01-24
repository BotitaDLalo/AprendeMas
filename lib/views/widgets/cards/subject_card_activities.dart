import 'package:aprende_mas/models/models.dart';
import 'package:flutter/material.dart';

class CustomActivitiesContainer extends StatelessWidget {
  // final Activities? actividades;
  final Activity? actividades;
  const CustomActivitiesContainer({super.key, required this.actividades});

  String dateFormat(String date) {
    return date.substring(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${actividades?.nombreActividad.trim() ?? ""}\n',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                TextSpan(
                  text:
                      "Asignada: ${dateFormat(actividades?.fechaCreacion.toString().trim() ?? "")}",
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            textAlign: TextAlign.left,
          )),
    );
  }
}
