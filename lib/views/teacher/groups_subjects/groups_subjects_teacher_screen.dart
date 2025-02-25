import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/views/widgets/buttons/floating_action_button_custom.dart';

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
    void modalBottom() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16), // Bordes redondeados
          ),
        ),
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
        floatingActionButton: FloatingActionButtonCustom(
            voidCallback: () {
              modalBottom();
            },
            icon: Icons.add),
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              tabs: const [
                Tab(text: 'Grupos y Materias'),
                Tab(text: 'Materias Sin Grupo'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  GroupsSubjectsContainer(),
                  SubjectsWithoutGroupsContainer(),
                ],
              ),
            ),
          ],
        ));
  }
}
