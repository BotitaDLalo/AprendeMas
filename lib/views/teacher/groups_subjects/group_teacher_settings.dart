import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'form_update_group.dart';

class GroupTeacherSettings extends ConsumerWidget {
  final int id;
  final String groupName;
  final String description;
  final String accessCode;
  final String colorCode;

  const GroupTeacherSettings(
      {super.key,
      required this.id,
      required this.groupName,
      required this.description,
      required this.accessCode,
      required this.colorCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FormScreen(
        form: FormUpdateGroup(
      id: id,
      groupName: groupName,
      description: description,
      accesCode: accessCode,
      colorCode: colorCode,
    ));
  }
}
