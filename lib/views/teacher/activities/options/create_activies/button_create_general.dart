import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:aprende_mas/models/models.dart';

class ButtonCreateGeneral extends StatelessWidget {
  final int subjectId;
  final String subjectName;
  const ButtonCreateGeneral({
    super.key, 
    required this.subjectId, 
    required this.subjectName});

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.create),
              title: const Text("Actividad"),
              onTap: () {
                Navigator.pop(context);
                    final data = Subject(
                    subjectId: subjectId, nombreMateria: subjectName,);
                context.go('/create-activities', extra: data);
                // Agregar lógica para crear Actividad
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment),
              title: const Text("Examen"),
              onTap: () {
                Navigator.pop(context);
                // Agregar lógica para crear Examen
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text("Archivo"),
              onTap: () {
                Navigator.pop(context);
                // Agregar lógica para subir Archivo
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: FilledButton(
          onPressed: () => _showOptions(
              context), // Llama a _showOptions al presionar el botón
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.blue),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 40),
            ),
          ),
          child: const Text('Crear'),
        ),
      ),
    );
  }
}
