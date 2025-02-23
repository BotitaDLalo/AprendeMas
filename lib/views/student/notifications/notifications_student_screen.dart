import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/users.dart';

class NotificationsStudentScreen extends ConsumerStatefulWidget {
  const NotificationsStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticesStudentScreenState();
}

class _NoticesStudentScreenState extends ConsumerState<NotificationsStudentScreen> {

  @override
  Widget build(BuildContext context) {
    return const NotificationsScreen();
  }
}