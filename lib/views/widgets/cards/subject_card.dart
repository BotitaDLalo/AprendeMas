import 'package:aprende_mas/views/widgets/cards/subject_card_activities.dart';
import 'package:aprende_mas/views/widgets/cards/subject_card_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import 'subject_card_footer.dart';

class SubjectCard extends ConsumerWidget {
  final int subjectId;
  final String nombreMateria;
  final String description;
  final List<Activities>? actividades;
  
  const SubjectCard({
    super.key, 
    required this.subjectId,
    required this.nombreMateria,
    required this.description,
    required this.actividades, 
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final actividades = ref.watch(activitiesProvider);
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 250,
        child: Column(
          children: [
            CustomHeaderContainer(nombreMateria: nombreMateria,),
            Expanded(child: CustomActivitiesContainer(actividades: actividades)),
            const Divider(
              color: Colors.black,
              height: 0.5,
            ),
            CustomFooterContainer(subjectId: subjectId,subjectName: nombreMateria,description: description,),            
          ],
        ),
      ),
    );
  }
}