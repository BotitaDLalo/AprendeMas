import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/views/teacher/agenda/form_update_event.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:flutter/material.dart';

class UpdateEventScreen extends StatelessWidget {
  final Event event;

  const UpdateEventScreen({super.key, required this.event});

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
                    titulo: 'Crear Evento',
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
                child: FormUpdateEvent(event),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

