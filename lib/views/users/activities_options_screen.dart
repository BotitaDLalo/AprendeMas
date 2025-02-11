import 'package:aprende_mas/config/utils/packages.dart';
import 'activity_list.dart';
import '../teacher/activities/options/create_activies/button_create_general.dart';
import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/config/data/data.dart';

// final isTeacherProvider = StateProvider(
//   (ref) => false,
// );

class ActivitiesOptionScreen extends ConsumerStatefulWidget {
  final int subjectId;
  final String subjectName;

  const ActivitiesOptionScreen(
      {super.key, required this.subjectId, required this.subjectName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ActivityOptionState();
}

class _ActivityOptionState extends ConsumerState<ActivitiesOptionScreen> {
  final kvs = KeyValueStorageServiceImpl();
  final cn = CatalogNames();

  @override
  void initState() {
    super.initState();
  }

  void getRole() async {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: AppTheme.shapeFloatingActionButton(),
        child: Icon(
          Icons.add,
          color: Colors.grey.withOpacity(0.8),
        ),
        onPressed: () {
          ButtonCreateGeneral(
            subjectId: widget.subjectId,
            subjectName: widget.subjectName,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ref.watch(isTeacherProvider)
            //     ? ButtonCreateGeneral(
            //         subjectId: widget.subjectId,
            //         nombreMateria: widget.subjectName,
            //       )
            //     : const SizedBox(),
            const SizedBox(height: 10),
            Expanded(
              child: ActivityList(subjectId: widget.subjectId),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
