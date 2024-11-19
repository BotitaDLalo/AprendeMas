import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/activities/options/options.dart';
import 'package:aprende_mas/views/widgets/activities_body/container_subject_name.dart';
import 'package:aprende_mas/views/widgets/activities_body/options_activities.dart';
import 'package:go_router/go_router.dart';

class ActivitiesScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;
  final String description;

  const ActivitiesScreen(
      {super.key,
      required this.subjectId,
      required this.subjectName,
      required this.description});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActividadesScreenState();
}

class _ActividadesScreenState extends ConsumerState<ActivitiesScreen> {
  int selectedOptionIndex = 0; // Estado para la opción seleccionada

  void onOptionSelected(int index) {
    setState(() {
      selectedOptionIndex = index; // Actualiza el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    final String codeAccess = 'ABC1234';

    // Contenido correspondiente a cada opción
    Widget getContent() {
      switch (selectedOptionIndex) {
        case 0:
          return const NoticeOptionsScreen(); // Tu pantalla de avisos
        case 1:
          return const ActivitiesOptionScreen(); // Tu pantalla de actividades
        case 2:
          return const StudentsOptionsScreen(); // Tu pantalla de alumnos
        case 3:
          return const RatingsOptionsScreen(); // Tu pantalla de calificaciones
        default:
          return const ActivitiesOptionScreen(); // Por defecto, pantalla de actividades
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              context.go("/teacher-home");
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Actividades screen'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ContainerSubjectName(
            subject: widget.subjectName,
            codeAccess: codeAccess,
          ),
          OptionsActivities(
            onOptionSelected: onOptionSelected, // Pasa el callback
            selectedOptionIndex:
                selectedOptionIndex, // Pasa el índice seleccionado
          ),
          Expanded(
            child: getContent(), // Muestra el contenido correspondiente
          ),
        ],
      ),
    );
  }
}
