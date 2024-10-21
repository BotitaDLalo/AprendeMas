import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/widgets/cards/subject_scroll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/groups/form_groups_provider.dart';
import 'custom_expansion_tile.dart';

class MainContainer extends ConsumerStatefulWidget {
  const MainContainer({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomExpansionState();
}

class _CustomExpansionState extends ConsumerState<MainContainer> {
  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider);

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final grupo = groups[index];
        return CustomExpansionTile(
          title: grupo.nombreGrupo,
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