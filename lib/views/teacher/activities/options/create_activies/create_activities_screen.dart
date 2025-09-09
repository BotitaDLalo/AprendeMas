import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity/activty_form_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/button_ai.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/form_activities.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class CreateActivitiesScreen extends ConsumerWidget {
  final int subjectId;
  final String nombreMateria;

  const CreateActivitiesScreen({super.key, required this.subjectId, required this.nombreMateria});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityCreated = ref.read(activityFormProvider.notifier);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Stack(
                children: [
                  HeaderTile(
                    svg: 'assets/icons/agregar-tarea.svg', 
                    titulo: 'Crear Actividades',
                    // colorUno: Color(0xff536cf6),
                    // colorDos: Color(0xff66A9F2),
                  ),
                  Positioned(
                    left: 10,
                    top: 40,
                    child: ButtonClose(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: FormActivities(subjectId: subjectId, nombreMateria: nombreMateria,)
              ),
            ],
          ),
        ),
        floatingActionButton: ButtonAI(
          tituloController: activityCreated.nombreController,
          descripcionController: activityCreated.descripcionController,
        ),
      ),
    );
  }
}



// class CreateActivitiesScreen extends StatelessWidget {
//   final int subjectId;
//   final String nombreMateria;

//   const CreateActivitiesScreen({super.key, required this.subjectId, required this.nombreMateria});

//   @override
//   Widget build(BuildContext context) {
//       //  debugPrint('CreateActivitiesScreen: subjectId: $subjectId, nombreMateria: $nombreMateria');
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Stack(
//                 children: [
//                   HeaderTile(
//                     svg: 'assets/icons/agregar-tarea.svg', 
//                     titulo: 'Crear Actividades',
//                     // colorUno: Color(0xff536cf6),
//                     // colorDos: Color(0xff66A9F2),
//                   ),
//                   Positioned(
//                     left: 10,
//                     top: 40,
//                     child: ButtonClose(),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: FormActivities(subjectId: subjectId, nombreMateria: nombreMateria,)
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: ButtonAI(),
//       ),
//     );
//   }
// }