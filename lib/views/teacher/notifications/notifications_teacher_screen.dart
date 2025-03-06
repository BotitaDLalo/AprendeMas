import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/users.dart';

class NotificationsTeacherScreen extends ConsumerStatefulWidget {
  const NotificationsTeacherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticesStudentScreenState();
}

class _NoticesStudentScreenState extends ConsumerState<NotificationsTeacherScreen> {

  @override
  Widget build(BuildContext context) {
    return const NotificationsScreen();
  }
}