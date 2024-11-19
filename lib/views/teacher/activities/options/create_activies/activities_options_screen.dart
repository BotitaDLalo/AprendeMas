import 'package:aprende_mas/config/utils/packages.dart';
import 'activity_list.dart';
import 'button_create_general.dart';

class ActivitiesOptionScreen extends ConsumerStatefulWidget {
  const ActivitiesOptionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityOptionState();
}

class _ActivityOptionState extends ConsumerState<ActivitiesOptionScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ButtonCreateGeneral(),  
            ActivityList(),
            SizedBox(height: 10,),
            Text('        Nombre Tema'),
          ],
        ),
      ),
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}

