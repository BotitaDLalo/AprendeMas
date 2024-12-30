import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/users.dart';

class NoticesStudentScreen extends ConsumerStatefulWidget {
  const NoticesStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NoticesStudentScreenState();
}

class _NoticesStudentScreenState extends ConsumerState<NoticesStudentScreen> {

  @override
  Widget build(BuildContext context) {
    return const NoticesScreen();
  }
}