import 'package:aprende_mas/config/utils/packages.dart';

class GroupOptions extends StatelessWidget {
  final ValueChanged<int> onOptionSelected;
  final int selectedOptionIndex;

  const GroupOptions({
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
          children: List.generate(4, (index) {
            String optionText;
            switch (index) {
              case 0:
                optionText = 'Avisos';
                break;
              case 1:
                optionText = 'Alumnos asignados';
                break;
              case 2:
                optionText = 'Agregar alumnos';
                break;
              case 3:
                optionText = 'Configuración';
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: selectedOptionIndex == index
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(
                              milliseconds: 500), 
                          height: 2,
                          width: selectedOptionIndex == index
                              ? 90
                              : 0, 
                          color: Colors.blue,
                          curve: Curves.easeInOut, 
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
