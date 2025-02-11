import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';
import 'package:aprende_mas/providers/groups/students_group_provider.dart';

class StudentsGroup extends ConsumerStatefulWidget {
  final int id;
  const StudentsGroup({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentsGroupState();
}

class _StudentsGroupState extends ConsumerState<StudentsGroup> {
  @override
  Widget build(BuildContext context) {
    final lsStudents = ref.watch(studentsGroupProvider).lsStudentsGroup;

    void showStudentOptions() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16), // Bordes redondeados
          ),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Eliminar notificación'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 350,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 360,
                  child: ListView.builder(
                    itemCount: lsStudents.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () {
                          showStudentOptions();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade200,
                          ),
                          child: ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.person),
                              iconSize: 30,
                            ),
                            title: Text(lsStudents[index].username),
                            subtitle: Text(
                                "${lsStudents[index].name} ${lsStudents[index].lastName} ${lsStudents[index].lastName2}"),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
