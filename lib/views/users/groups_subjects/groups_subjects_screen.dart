import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/groups_subjects_container.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/subjects_without_groups_container.dart';
import 'package:aprende_mas/views/widgets/buttons/floating_action_button_custom.dart';

class GroupsSubjectsScreen extends ConsumerStatefulWidget {
  final VoidCallback voidCallback;
  const GroupsSubjectsScreen({super.key, required this.voidCallback});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupsSubjectsScreenState();
}

class _GroupsSubjectsScreenState extends ConsumerState<GroupsSubjectsScreen>
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
    return Scaffold(
        floatingActionButton: FloatingActionButtonCustom(
            voidCallback: widget.voidCallback, icon: Icons.add),
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
