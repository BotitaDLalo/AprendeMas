import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/activities/options/options.dart';
import 'package:aprende_mas/views/widgets/activities_body/container_subject_name.dart';
import 'package:aprende_mas/views/widgets/activities_body/options_activities.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
  final itemTappedProvider = StateProvider<int>((ref) => 0);
class TeacherSubjectOptionsScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;
  final String description;
  final String codeAccess;

  const TeacherSubjectOptionsScreen(
      {super.key,
      required this.subjectId,
      required this.subjectName,
      required this.description,
      required this.codeAccess});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActividadesScreenState();
}

class _ActividadesScreenState extends ConsumerState<TeacherSubjectOptionsScreen> {
  void onOptionSelected(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final String codeAccess = 'ABC1234';

     debugPrint('ActivitiesTeacherScreen subjectId from ActivitiesTeacherScreen: ${widget.subjectId}');

    // Contenido correspondiente a cada opción
    Widget getContent() {
      switch (ref.read(itemTappedProvider)) {
        case 0:
          return const NoticeOptionsScreen();
        case 1:
         return ActivitiesOptionScreen(subjectId: widget.subjectId, subjectName: widget.subjectName,);
        case 2:
          return const StudentsOptionsScreen();
        case 3:
          return const RatingsOptionsScreen();
        default:
          return ActivitiesOptionScreen(subjectId: widget.subjectId, subjectName: widget.subjectName);
      }
    }

    return Scaffold(
      appBar: const AppBarScreens(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ContainerNameGroupSubjects(
            name: widget.subjectName,
            accessCode: codeAccess,
          ),
          OptionsActivities(
            onOptionSelected: onOptionSelected, // Pasa el callback
            selectedOptionIndex: ref.watch(itemTappedProvider), // Pasa el índice seleccionado
          ),
          Expanded(
            child: getContent(), // Muestra el contenido correspondiente
          ),
        ],
      ),
    );
  }
}
