import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';
import 'package:aprende_mas/views/student/student.dart';

final itemTappedProvider = StateProvider<int>((ref) => 1);

class StudentSubjectOptionsScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;
  final String description;
  const StudentSubjectOptionsScreen({
    super.key,
    required this.subjectId,
    required this.subjectName,
    required this.description,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentSubjectOptionsScreenState();
}

class _StudentSubjectOptionsScreenState
    extends ConsumerState<StudentSubjectOptionsScreen> {
  void onOptionSelected(int index) {
    ref.read(itemTappedProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    final itemTapped = ref.watch(itemTappedProvider);

    List<GroupSubjectWidgetOption> lsSubjectWidgetOptions = [
      GroupSubjectWidgetOption(
          optionId: 1,
          isVisible: true,
          optionText: 'Avisos',
          widgetOption: const StudentNoticeOptionsScreen()),
      GroupSubjectWidgetOption(
          optionId: 2,
          isVisible: true,
          optionText: 'Actividades',
          widgetOption: ActivityOptionScreen(
              subjectId: widget.subjectId, subjectName: widget.subjectName)),
    ];

    List<GroupSubjectWidgetOption> lsSubjectOptions =
        GroupSubjectWidgetOption.getlsGroupSubjectOptions(
            lsSubjectWidgetOptions);

    Widget getWidget(int index) {
      GroupSubjectWidgetOption option = lsSubjectWidgetOptions.firstWhere(
        (element) => element.optionId == index,
      );
      return option.widgetOption!;
    }

    return Scaffold(
      appBar: const AppBarScreens(),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ContainerNameGroupSubjects(
            name: widget.subjectName,
            color: AppTheme.mainColor,
          ),
          StudentSubjectOptions(
              lsSubjectOptions: lsSubjectOptions,
              onOptionSelected: onOptionSelected,
              selectedOptionIndex: ref.watch(itemTappedProvider)),
          Expanded(
            child:
                getWidget(itemTapped), // Muestra el contenido correspondiente
          ),
        ],
      ),
    );
  }
}
