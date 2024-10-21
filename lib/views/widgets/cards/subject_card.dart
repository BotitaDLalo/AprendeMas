import 'package:aprende_mas/providers/activities/activities_provider.dart';
import 'package:aprende_mas/views/widgets/custom_conatiners/custom_activities_container.dart';
import 'package:aprende_mas/views/widgets/custom_conatiners/custom_header_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../custom_conatiners/custom_footer_container.dart';

class SubjectCard extends ConsumerWidget {
  final String nombreMateria;
  final List<Activities>? actividades;
  
  const SubjectCard({
    super.key, 
    required this.nombreMateria,
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
            const CustomFooterContainer(),            
          ],
        ),
      ),
    );
  }
}