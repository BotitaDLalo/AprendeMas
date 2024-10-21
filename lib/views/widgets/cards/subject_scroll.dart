import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/subjects/subjects_provider.dart';
import 'package:aprende_mas/views/widgets/cards/subject_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SubjectScroll extends ConsumerWidget { 
  final List<Subject> materias;
  const SubjectScroll({
    super.key,
    required this.materias
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final materias = ref.watch(subjectProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(var materia in materias)
          SubjectCard(
            nombreMateria: materia.nombreMateria,
            actividades: materia.actividades,
          )
        ],
      ),
    );
  }
}