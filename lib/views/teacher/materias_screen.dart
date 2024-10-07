import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:flutter/material.dart';

class MateriasScreen extends StatelessWidget {
  const MateriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: const Alignment(-0.9, 0),
                child: Text(
                  'Mis Cursos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Container(
                  alignment: const Alignment(0.9, 0),
                  child: ButtonForm(buttonName: 'Crear', onPressed: () {})),
              const SizedBox(
                height: 20,
              ),
              CustomCard(),
            ],
          ),
        ),
      ),
    );
  }
}
