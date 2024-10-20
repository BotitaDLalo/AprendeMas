import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/activities/options/activities_options_screen.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';


class ActivitiesScreen extends ConsumerStatefulWidget {
  static String name = 'activity_screen';
  const ActivitiesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActividadesScreenState();
}

class _ActividadesScreenState extends ConsumerState<ActivitiesScreen> {

  @override
  Widget build(BuildContext context) {
    final String subjectName = 'Nombre de la materia';
    final String codeAccess = 'ABC1234';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades screen'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          ContainerSubjectName(
            subject: subjectName ,
            codeAccess: codeAccess,
          ),
          OptionsActivities(),
          Expanded(child: SingleChildScrollView(
            child: ActivitiesOptionScreen(),
          )),
        ],
      ),
    );
  }
}