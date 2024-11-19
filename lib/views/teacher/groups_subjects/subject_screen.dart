import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/groups_subjects_container.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/subjects_without_groups_container.dart';

class SubjectScreen extends ConsumerStatefulWidget {
  const SubjectScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends ConsumerState<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    final subjectScreenProvider = StateProvider<bool>((ref) => false);

    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Mis Cursos',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        PopupMenuButton<bool>(
                          onSelected: (value) {
                            ref.read(subjectScreenProvider.notifier).state =
                                value;
                          },
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                                value: true,
                                child: Text(
                                  "Grupos y materias",
                                  style: TextStyle(fontSize: 15),
                                )),
                            const PopupMenuItem(
                                value: false,
                                child: Text(
                                  "Materias sin grupo",
                                  style: TextStyle(fontSize: 15),
                                ))
                          ],
                          child: SvgPicture.asset(
                            "assets/icons/filtro.svg",
                            height: 60,
                          ),
                        )
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'createGroup') {
                        context.push('/create-group');
                      } else if (value == 'createSubject') {
                        context.push('/create-subject');
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'createGroup',
                        child: Text(
                          'Crear Grupo',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'createSubject',
                        child: Text('Crear Materia',
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(child: Consumer(builder: (context, ref, child) {
            final subjectScreen = ref.watch(subjectScreenProvider);
            return subjectScreen
                ? const GroupsSubjectsContainer()
                : const SubjectsWithoutGroupsContainer();
          }))
        ],
      ),
    );
  }
}
