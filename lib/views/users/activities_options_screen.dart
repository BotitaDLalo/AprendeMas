import 'package:aprende_mas/config/utils/packages.dart';
import 'activity_list.dart';
import '../teacher/activities/options/create_activies/button_create_general.dart';
import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/config/data/data.dart';

final isTeacherProvider = StateProvider(
  (ref) => false,
);

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
    Future.microtask(
      () async {
        ref.read(isTeacherProvider.notifier).state = await isTeacher();
      },
    );
  }

  Future<bool> isTeacher() async {
    final role = await kvs.getRole();
    if (role == cn.getRoleTeacherName) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'ActivitiesOptionScreen subjectId from ActivitiesOptionScreen: ${widget.subjectId}');

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 10), // Padding desde los lados
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ref.watch(isTeacherProvider)
              ? ButtonCreateGeneral(
                  subjectId: widget.subjectId,
                  nombreMateria: widget.subjectName,
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          // Asegúrate de envolver ActivityList en un ListView
          Expanded(
            child: ActivityList(subjectId: widget.subjectId),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
