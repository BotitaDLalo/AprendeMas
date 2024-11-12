import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';
import 'package:flutter/material.dart';

class EnrolledStudents extends StatelessWidget {
  const EnrolledStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerStyle(
      height: 30,
      width: double.infinity,
      color: Colors.transparent,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const Center(
                child: Text(
                  'Alumnos',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  // Acción al presionar el ícono
                },
                splashColor: Colors.grey,
                borderRadius: BorderRadius.circular(55),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: const Icon(
                    Icons.person_add_alt,
                    size: 30,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
