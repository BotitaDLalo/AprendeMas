import 'package:aprende_mas/config/utils/packages.dart';
import 'activity_list.dart';
import 'button_create_general.dart';

class ActivitiesOptionScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;

  const ActivitiesOptionScreen({
    super.key, 
    required this.subjectId,
    required this.subjectName
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityOptionState();
}

class _ActivityOptionState extends ConsumerState<ActivitiesOptionScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('ActivitiesOptionScreen subjectId from ActivitiesOptionScreen: ${widget.subjectId}');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Padding desde los lados
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonCreateGeneral( subjectId: widget.subjectId, nombreMateria: widget.subjectName,),  
          const SizedBox(height: 10),
          // Asegúrate de envolver ActivityList en un ListView
          Expanded(
            child: ActivityList(subjectId: widget.subjectId),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}