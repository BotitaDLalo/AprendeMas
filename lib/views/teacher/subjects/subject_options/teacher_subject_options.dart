import 'package:aprende_mas/config/utils/packages.dart';

class TeacherSubjectOptions extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;
  final int selectedOptionIndex;

  const TeacherSubjectOptions({
    super.key,
    required this.onOptionSelected,
    required this.selectedOptionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            String optionText;
      
            switch (index) {
              case 0:
                optionText = 'Avisos';
                break;
              case 1:
                optionText = 'Actividades';
                break;
              case 2:
                optionText = 'Alumnos asignados';
                break;
              case 3:
                optionText = 'Asignar alumnos';
                break;
              case 4:
                optionText = 'Calificaciones';
                break;
              default:
                optionText = '';
            }
      
            return Row(
              children: [
                Padding(
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
                            fontSize: 16,
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
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
