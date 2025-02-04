import 'package:aprende_mas/views/teacher/activities/options/create_activies/form_activities.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateActivitiesScreen extends StatelessWidget {
  final int subjectId;
  final String nombreMateria;

  const CreateActivitiesScreen({super.key, required this.subjectId, required this.nombreMateria});

  @override
  Widget build(BuildContext context) {
      //  debugPrint('CreateActivitiesScreen: subjectId: $subjectId, nombreMateria: $nombreMateria');
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Stack(
                children: [
                  HeaderTile(
                    svg: 'assets/icons/agregar-tarea.svg', 
                    titulo: 'Crear Actividades',
                    // colorUno: Color(0xff536cf6),
                    // colorDos: Color(0xff66A9F2),
                  ),
                  Positioned(
                    left: 10,
                    top: 40,
                    child: ButtonClose(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FormActivities(subjectId: subjectId, nombreMateria: nombreMateria,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

