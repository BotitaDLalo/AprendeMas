import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/groups_subjects/groups_subjects_screen.dart';
import 'package:aprende_mas/views/widgets/structure/modal_bottom_sheet_custom.dart';

class GroupsSubjectsTeacherScreen extends ConsumerStatefulWidget {
  const GroupsSubjectsTeacherScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupsSubjectsTeacherScreenState();
}

class _GroupsSubjectsTeacherScreenState
    extends ConsumerState<GroupsSubjectsTeacherScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lsOptions = [
      ListTile(
        leading: const Icon(Icons.group_add),
        title: const Text('Crear Grupo'),
        onTap: () {
          Navigator.pop(context);
          context.push('/create-group');
        },
      ),
      ListTile(
        leading: const Icon(Icons.create),
        title: const Text('Crear Materia'),
        onTap: () {
          Navigator.pop(context);
          context.push('/create-subject');
        },
      ),
    ];
    return GroupsSubjectsScreen(voidCallback: () => modalBottomSheetCustom(context, lsOptions));
  }
}
