import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';

class GroupTeacherOptions extends ConsumerStatefulWidget {
  final int groupId;
  final String groupName;
  final String description;
  final String? accessCode;
  final String colorCode;
  const GroupTeacherOptions(
      {super.key,
      required this.groupId,
      required this.groupName,
      required this.description,
      this.accessCode,
      required this.colorCode});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupTeacherOptionsState();
}

class _GroupTeacherOptionsState extends ConsumerState<GroupTeacherOptions> {
  final itemTappedProvider = StateProvider<int>((ref) => 0);

  void onOptionSelected(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  Widget getContent() {
    switch (ref.read(itemTappedProvider)) {
      case 0:
        return const NoticesGroupOptionsScreen();
      case 1:
        return StudentsGroup(id: widget.groupId);
      case 2:
        return StudentsGroupAssigment(id: widget.groupId);
      case 3:
        return FormUpdateGroup(
          id: widget.groupId,
          groupName: widget.groupName,
          description: widget.description,
          accesCode: widget.accessCode,
          colorCode: widget.colorCode,
        );
      default:
        return const Text("");
    }
  }

  @override
  void initState() {
    super.initState();
    ref.read(groupsProvider.notifier).getStudentsGroup(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarScreens(
        onPopCallback: () {
          ref.read(addStudentMessageProvider.notifier).state = false;
        },
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ContainerNameGroupSubjects(
            name: widget.groupName,
            accessCode: widget.accessCode,
            colorCode: widget.colorCode,
          ),
          TeacherGroupOptions(
              onOptionSelected: onOptionSelected,
              selectedOptionIndex: ref.watch(itemTappedProvider)),
          Expanded(
            child: getContent(),
          ),
        ],
      ),
    );
  }
}
