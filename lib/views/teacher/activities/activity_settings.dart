import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';

class ActivitySettings extends ConsumerStatefulWidget {
  final Activity activity;
  const ActivitySettings({super.key, required this.activity});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivitySettingsState();
}

class _ActivitySettingsState extends ConsumerState<ActivitySettings> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}