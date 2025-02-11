import 'package:aprende_mas/views/widgets/cards/subject_card.dart';
import '../../../config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';

class SubjectsWithoutGroupsContainer extends ConsumerStatefulWidget {
  const SubjectsWithoutGroupsContainer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubjectsWithoutGroupsState();
}

class _SubjectsWithoutGroupsState
    extends ConsumerState<SubjectsWithoutGroupsContainer> {
  @override
  void initState() {
    super.initState();
    // ref.read(subjectsProvider.notifier).getSubjects();
    
  }

  Color stringToColor(String hexColor) {
    Color colorCode = Color(int.parse("0xFF$hexColor"));
    return colorCode;
  }

  @override
  Widget build(BuildContext context) {
    final subjects = ref.watch(subjectsProvider).subjects;
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        final subject = subjects[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SubjectCard(
              subjectId: subject.materiaId,
              nombreMateria: subject.nombreMateria,
              description: subject.descripcion ?? "",
              actividades: subject.actividades),
        );
      },
    );
  }
}