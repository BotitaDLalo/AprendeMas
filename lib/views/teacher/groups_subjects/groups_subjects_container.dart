import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/views/widgets/cards/subject_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../widgets/custom_conatiners/custom_expansion_tile.dart';

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
    ref.read(groupsProvider.notifier).getGroups();
  }

  Color stringToColor(String hexColor){
    Color colorCode = Color(int.parse("0xFF$hexColor"));
    return colorCode;
  }

  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider).groups;

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final grupo = groups[index];
        return CustomExpansionTile(
          title: grupo.nombreGrupo,
          color: stringToColor(grupo.codigoColor),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SubjectScroll(
                materias: grupo.materias,
              ),
            )
          ],
        );
      },
    );
  }
}