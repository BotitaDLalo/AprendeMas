import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/student/student.dart';

class GroupsSubjectsStudentScreen extends ConsumerStatefulWidget {
  const GroupsSubjectsStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubjectsStudentScreenState();
}

class _SubjectsStudentScreenState extends ConsumerState<GroupsSubjectsStudentScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(),
          )
        ],
      ),
    );
  }
}
