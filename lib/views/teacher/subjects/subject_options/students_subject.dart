import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/providers/subjects/students_subject_provider.dart';

class StudentsSubject extends ConsumerStatefulWidget {
  final int id;
  const StudentsSubject({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentsSubjectState();
}

class _StudentsSubjectState extends ConsumerState<StudentsSubject> {
  @override
  Widget build(BuildContext context) {
    final lsStudents = ref.watch(studentsSubjectProvider).lsStudentsSubject;

    void showStudentOptions(
        String username, String name, String lastName, String lastName2) {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
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
                  leading: const Icon(Icons.person_remove_alt_1),
                  title: const Text('Eliminar alumno'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          '¿Deseas eliminar el alumno?',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        content: ListTile(
                          leading: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person),
                            iconSize: 30,
                          ),
                          title: Text(username),
                          subtitle: Text("$name $lastName $lastName2"),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar')),
                          TextButton(
                              onPressed: () {
                                //TODO: Eliminar el alumno de la materia
                              }, child: const Text('Eliminar'))
                        ],
                      ),
                    );
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
                          showStudentOptions(
                              lsStudents[index].username,
                              lsStudents[index].name,
                              lsStudents[index].lastName,
                              lsStudents[index].lastName2);
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
