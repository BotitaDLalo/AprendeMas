import 'package:flutter/material.dart';

class OptionsActivities extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;
  final int selectedOptionIndex;

  const OptionsActivities({
    super.key,
    required this.onOptionSelected,
    required this.selectedOptionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (index) {
          String optionText;

          switch (index) {
            case 0:
              optionText = 'Avisos';
              break;
            case 1:
              optionText = 'Actividades';
              break;
            case 2:
              optionText = 'Alumnos';
              break;
            case 3:
              optionText = 'Calificaciones';
              break;
            default:
              optionText = '';
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                onOptionSelected(index); // Llama al callback
              },
              child: Column(
                children: [
                  Text(
                    optionText,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: selectedOptionIndex == index
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(
                        milliseconds: 500), // Duración de la animación
                    height: 2,
                    width: selectedOptionIndex == index
                        ? 90
                        : 0, // Cambia el ancho basado en la selección
                    color: Colors.blue,
                    curve: Curves.easeInOut, // Curva de la animación
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
