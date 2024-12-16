import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'form_activities.dart';

class CreateActivitiesScreen extends StatelessWidget {
  const CreateActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: FormActivities(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

