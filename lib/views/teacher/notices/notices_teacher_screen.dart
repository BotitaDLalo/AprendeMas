import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/users.dart';

class NoticesTeacherScreen extends ConsumerStatefulWidget {
  const NoticesTeacherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticesStudentScreenState();
}

class _NoticesStudentScreenState extends ConsumerState<NoticesTeacherScreen> {

  @override
  Widget build(BuildContext context) {
    return const NoticesScreen();
  }
}