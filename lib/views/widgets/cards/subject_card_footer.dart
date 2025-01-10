import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/data/data.dart';

class CustomFooterContainer extends StatelessWidget {
  final int subjectId;
  final String subjectName;
  final String description;
  const CustomFooterContainer(
      {super.key,
      required this.subjectId,
      required this.subjectName,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final cn = CatalogNames();
    final storageService = KeyValueStorageServiceImpl();
    return Container(
      width: double.infinity,
      height: 48,
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {
                final data = Subject(
                    subjectId: subjectId,
                    nombreMateria: subjectName,
                    descripcion: description);

                    final futureRole = storageService.getRole().then((value) => value,);


                context.push('/teacher-subject-options', extra: data);
              },
              icon: const Icon(Icons.assignment)),
          // const SizedBox(
          //   width: 60,
          // ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.people_alt)),
          // const SizedBox(
          //   width: 60,
          // ),
          // IconButton(
          //     onPressed: () {}, icon: const Icon(Icons.star_border_rounded)),
        ],
      ),
    );
  }
}
