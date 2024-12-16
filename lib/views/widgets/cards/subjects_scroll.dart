import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/widgets/cards/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectScroll extends ConsumerWidget {
  final List<Subject>? materias;
  const SubjectScroll({super.key, required this.materias});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var materia in materias ?? [])
            SubjectCard(
              subjectId: materia.subjectId,
              nombreMateria: materia.nombreMateria,
              description: materia.descripcion ?? "",
              actividades: materia.actividades,
            )
        ],
      ),
    );
  }
}
