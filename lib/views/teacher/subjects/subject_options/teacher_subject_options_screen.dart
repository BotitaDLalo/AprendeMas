import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/teacher/activities/options/options.dart';
import 'package:aprende_mas/views/teacher/subjects/subject_options/students_subject.dart';
import 'package:aprende_mas/views/teacher/subjects/subject_options/teacher_subject_options.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

final itemTappedProvider = StateProvider<int>((ref) => 0);

class TeacherSubjectOptionsScreen extends ConsumerStatefulWidget {
  final int? groupId;
  final int subjectId;
  final String subjectName;
  final String description;
  final String codeAccess;

  const TeacherSubjectOptionsScreen(
      {super.key,
      this.groupId,
      required this.subjectId,
      required this.subjectName,
      required this.description,
      required this.codeAccess});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActividadesScreenState();
}

class _ActividadesScreenState
    extends ConsumerState<TeacherSubjectOptionsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(subjectsProvider.notifier).getStudentsSubject(widget.subjectId);
  }

  void onOptionSelected(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final String codeAccess = 'ABC1234';

    debugPrint(
        'ActivitiesTeacherScreen subjectId from ActivitiesTeacherScreen: ${widget.subjectId}');

    // Contenido correspondiente a cada opción
    Widget getContent() {
      switch (ref.read(itemTappedProvider)) {
        case 0:
          return const NoticeOptionsScreen();
        case 1:
          return ActivitiesOptionScreen(
            subjectId: widget.subjectId,
            subjectName: widget.subjectName,
          );
        case 2:
          return StudentsSubject(id: widget.subjectId);
        case 3:
          return StudentsSubjectAssignment(
              groupId: widget.groupId, subjectId: widget.subjectId);
        case 4:
          return const RatingsOptionsScreen();
        default:
          return ActivitiesOptionScreen(
              subjectId: widget.subjectId, subjectName: widget.subjectName);
      }
    }

    void clearScreen() {
      ref.read(addStudentMessageProvider.notifier).state = false;
      ref.read(subjectsProvider.notifier).clearSubjectTeacherOptionsLs();
    }

    return Scaffold(
      appBar: AppBarScreens(
        onPopCallback: () {
          clearScreen();
        },
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ContainerNameGroupSubjects(
            name: widget.subjectName,
            accessCode: codeAccess,
          ),
          TeacherSubjectOptions(
            onOptionSelected: onOptionSelected, // Pasa el callback
            selectedOptionIndex:
                ref.watch(itemTappedProvider), // Pasa el índice seleccionado
          ),
          Expanded(
            child: getContent(), // Muestra el contenido correspondiente
          ),
        ],
      ),
    );
  }
}
