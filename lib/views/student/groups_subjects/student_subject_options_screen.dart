import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:aprende_mas/views/student/student.dart';

final itemTappedProvider = StateProvider<int>((ref) => 0);

class StudentSubjectOptionsScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;
  final String description;
  const StudentSubjectOptionsScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
    required this.description,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentSubjectOptionsScreenState();
}

class _StudentSubjectOptionsScreenState
    extends ConsumerState<StudentSubjectOptionsScreen> {
  void onOptionSelected(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  Widget getContent() {
    switch (ref.read(itemTappedProvider)) {
      case 0:
        return const NoticeOptionsScreen();
      case 1:
        return ActivitiesOptionScreen(subjectId: widget.subjectId, subjectName: widget.subjectName);
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarScreens(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ContainerNameGroupSubjects(
            name: widget.subjectName,
          ),
          StudentSubjectOptions(
              onOptionSelected: onOptionSelected,
              selectedOptionIndex: ref.watch(itemTappedProvider)),
          Expanded(
            child: getContent(), // Muestra el contenido correspondiente
          ),
        ],
      ),
    );
  }
}
