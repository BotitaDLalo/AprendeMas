import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class ActivitiesOptionScreen extends ConsumerStatefulWidget {
  const ActivitiesOptionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityOptionState();
}

class _ActivityOptionState extends ConsumerState<ActivitiesOptionScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ButtonCreate(),
          ActivityBody(),
          SizedBox(height: 10,),
          ActivityBodyRelleno(),
          SizedBox(height: 10,),
          Text('        Nombre Tema'),
          _CustomDivider(),
          ExamBody(),
          SizedBox(height: 10,),
          UploadBody(),
        ],
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

class _ButtonCreate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        child: FilledButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(Colors.blue), 
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
              )),
            padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 40))
          ), 
          child: const Text('Crear'),
        )),
    );
  }
}