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
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255),
      elevation: 4,
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        height: 250,
        child: Column(
          children: [
            CustomHeaderContainer(nombreMateria: nombreMateria),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: SizedBox(
                  height: 160, // Limita la altura del contenedor para las actividades
                  child: ListView.builder(
                    itemCount: actividades?.take(3).length ?? 0,
                    itemBuilder: (context, index) {
                      final actividad = actividades![index];
                      return CustomActivitiesContainer(
                        actividades: [actividad], // Pasamos una lista con un solo elemento
                      );
                    },
                  ),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 0.5,
            ),
            CustomFooterContainer(
              subjectId: subjectId,
              subjectName: nombreMateria,
              description: description,
            ),
          ],
        ),
      ),
    );
  }
}


// class SubjectCard extends ConsumerWidget {
//   final int subjectId;
//   final String nombreMateria;
//   final String description;
//   final List<Activities>? actividades;

//   const SubjectCard({
//     super.key,
//     required this.subjectId,
//     required this.nombreMateria,
//     required this.description,
//     required this.actividades,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Card(
//       color: const Color.fromARGB(255, 255, 255, 255),
//       elevation: 4,
//       margin: const EdgeInsets.all(8.0),
//       child: Container(
//         width: 300,
//         height: 250,
//         child: Column(
//           children: [
//             CustomHeaderContainer(nombreMateria: nombreMateria),
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
//                 child: ClipRect(
//                   child: OverflowBox(
//                     maxHeight: 150, // Limitar altura para las actividades
//                     child: CustomActivitiesContainer(
//                       actividades: actividades,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const Divider(
//               color: Colors.black,
//               height: 0.5,
//             ),
//             CustomFooterContainer(
//               subjectId: subjectId,
//               subjectName: nombreMateria,
//               description: description,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

