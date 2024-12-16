import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/form_create_subject.dart';
import 'package:aprende_mas/views/widgets/structure/form_screen.dart';

class CreateSubjectsScreen extends ConsumerWidget {
  const CreateSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return const FormScreen(form: FormCreateSubject());
  }
}
