import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/groups_subjects_container.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/subjects_without_groups_container.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';

final groupsSubjectsProvider = StateProvider<bool>((ref) => false);
final subjectsWithoutGroupProvider = StateProvider<bool>(
  (ref) => false,
);

class GroupsSubjectsTeacherScreen extends ConsumerStatefulWidget {
  const GroupsSubjectsTeacherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubjectTeacherScreenState();
}

class _SubjectTeacherScreenState
    extends ConsumerState<GroupsSubjectsTeacherScreen> {
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    final groupsSubjects = ref.read(groupsSubjectsProvider.notifier);
    final subjectsWithoutGroups =
        ref.read(subjectsWithoutGroupProvider.notifier);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16), // Bordes redondeados
              ),
            ),
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.group_add),
                      title: const Text('Crear Grupo'),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/create-group');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.create),
                      title: const Text('Crear Materia'),
                      onTap: () {
                        Navigator.pop(context);
                        context.push('/create-subject');
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          Icons.add,
          color: Colors.grey.withOpacity(0.8),
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.4), // Margen tenue
                          width: 1,
                        ),
                      ),
                      label: const Text('Grupos y Materias'),
                      selected: ref.watch(groupsSubjectsProvider),
                      onSelected: (value) {
                        final isSubjectsWithoutGroupSelected =
                            ref.read(subjectsWithoutGroupProvider);

                        final isGroupsSubjectsSelected =
                            ref.read(groupsSubjectsProvider);

                        if (isSubjectsWithoutGroupSelected) {
                          subjectsWithoutGroups.state = false;
                          groupsSubjects.state = true;
                        } else if (isGroupsSubjectsSelected) {
                          groupsSubjects.state = false;
                        } else {
                          groupsSubjects.state = true;
                        }
                      },
                    ),
                    FilterChip(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.4), // Margen tenue
                          width: 1,
                        ),
                      ),
                      label: const Text('Materias Sin Grupo'),
                      selected: ref.watch(subjectsWithoutGroupProvider),
                      onSelected: (value) {
                        final isSubjectsWithoutGroupSelected =
                            ref.read(subjectsWithoutGroupProvider);

                        final isGroupsSubjectsSelected =
                            ref.read(groupsSubjectsProvider);

                        if (isGroupsSubjectsSelected) {
                          groupsSubjects.state = false;
                          subjectsWithoutGroups.state = true;
                        } else if (isSubjectsWithoutGroupSelected) {
                          subjectsWithoutGroups.state = false;
                        } else {
                          subjectsWithoutGroups.state = true;
                        }
                      },
                    )
                  ])),
          Expanded(child: Consumer(builder: (context, ref, child) {
            final groupsSubjects = ref.watch(groupsSubjectsProvider);
            final subjectsWithoutGroups =
                ref.watch(subjectsWithoutGroupProvider);
            return groupsSubjects
                ? const GroupsSubjectsContainer()
                : subjectsWithoutGroups
                    ? const SubjectsWithoutGroupsContainer()
                    : const GroupsSubjectsVoid();
          }))
        ],
      ),
    );
  }
}
