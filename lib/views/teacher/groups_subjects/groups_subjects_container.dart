import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class GroupsSubjectsContainer extends ConsumerStatefulWidget {
  const GroupsSubjectsContainer({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomExpansionState();
}

class _CustomExpansionState extends ConsumerState<GroupsSubjectsContainer> {
  @override
  void initState() {
    super.initState();
    // ref.read(groupsProvider.notifier).getGroupsSubjects();
  }

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider).groups;

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final grupo = groups[index];
        return CustomExpansionTile(
          id: grupo.grupoId ?? -1,
          title: grupo.nombreGrupo,
          description: grupo.descripcion ?? "",
          accessCode: grupo.codigoAcceso,
          color: grupo.codigoColor,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubjectScroll(
                groupId: grupo.grupoId,
                materias: grupo.materias,
              ),
            )
          ],
        );
      },
    );
  }
}
