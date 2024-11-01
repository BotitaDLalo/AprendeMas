import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/activities_body/custom_container_style.dart';

class StudentsBody extends ConsumerWidget {
  const StudentsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomContainerStyle(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        borderColor: Colors.blue,
        child: Row(
          children: [
            SizedBox(width: 10,),
            Icon(Icons.person),
            SizedBox(width: 20,),
            Text('Nombre del alumno'),
            SizedBox(width: 50,),
            IconButton(onPressed: () {}, icon: Icon(Icons.mail))
          ],
        ),
      ),
    );
  }
}
