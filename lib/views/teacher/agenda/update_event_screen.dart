import 'package:aprende_mas/views/teacher/agenda/form_update_event.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:flutter/material.dart';

class UpdateEventScreen extends StatelessWidget {
  final int eventId;
  final int teacherId;
  final String title;
  final String description;
  final String color;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> groupIds;
  final List<String> subjectIds;

  const UpdateEventScreen({super.key, required this.eventId, required this.teacherId, required this.title, required this.description, required this.color, required this.startDate, required this.endDate, required this.groupIds, required this.subjectIds,});

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
                child: FormUpdateEvents(
                  eventId, teacherId, title, description, color,startDate, endDate, groupIds, subjectIds ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

