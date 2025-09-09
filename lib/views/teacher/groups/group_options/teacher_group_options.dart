import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

class TeacherGroupOptions extends StatelessWidget {
  final List<GroupSubjectWidgetOption> lsGroupOptions;
  final ValueChanged<int> onOptionSelected;
  final int selectedOptionIndex;

  const TeacherGroupOptions({
    super.key,
    required this.lsGroupOptions,
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
          children: lsGroupOptions.map((e) => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      onOptionSelected(e.optionId); // Llama al callback
                    },
                    child: Column(
                      children: [
                        Text(
                          e.optionText,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: selectedOptionIndex == e.optionId
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(
                              milliseconds: 500), 
                          height: 2,
                          width: selectedOptionIndex == e.optionId
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
            ),).toList()
        ),
      ),
    );
  }


}
