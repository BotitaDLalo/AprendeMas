import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/student/student.dart';

class GroupsSubjectsStudentScreen extends ConsumerStatefulWidget {
  const GroupsSubjectsStudentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupsSubjectsTeacherScreenState();
}

class _GroupsSubjectsTeacherScreenState
    extends ConsumerState<GroupsSubjectsStudentScreen>
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
