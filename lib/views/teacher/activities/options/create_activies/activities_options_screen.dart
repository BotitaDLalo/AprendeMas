import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/subjects/subjects.dart';
import 'package:aprende_mas/providers/activity_state/activity_provider.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/activity_body_molde.dart';
import 'activity_list.dart';
import 'button_create_general.dart';

class ActivitiesOptionScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String nombreMateria;

  const ActivitiesOptionScreen({
    super.key, 
    required this.subjectId,
    required this.nombreMateria
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
          ButtonCreateGeneral(subjectId: widget.subjectId, subjectName: widget.nombreMateria),  
          SizedBox(height: 10),
          // Asegúrate de envolver ActivityList en un ListView
          Expanded(
            child: ActivityList(subjectId: widget.subjectId),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}