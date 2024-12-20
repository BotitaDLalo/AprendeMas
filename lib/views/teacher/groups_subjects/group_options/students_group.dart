import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/groups_provider.dart';

class StudentsGroup extends ConsumerStatefulWidget {
  final int id;
  const StudentsGroup({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentsGroupState();
}

class _StudentsGroupState extends ConsumerState<StudentsGroup> {
  @override
  Widget build(BuildContext context) {
    final groups = ref.watch(groupsProvider);
    final lsStudents = groups.lsStudentsGroup;
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
                      return Container(
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
