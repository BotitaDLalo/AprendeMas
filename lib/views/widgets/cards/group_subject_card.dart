import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_provider.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
class GroupSubjectCard extends ConsumerWidget {
  final int index;
  final String subjectName;
  final String description;

  const GroupSubjectCard(
      {super.key,
      required this.index,
      required this.subjectName,
      required this.description});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formCreateGroupNotifier = ref.read(formGroupsProvider.notifier);

    Future<void> showUpdateSubjectForm(
        String subjectName, String description) async {
      final subjectNameController = TextEditingController(text: subjectName);
      final subjectDescriptionController =
          TextEditingController(text: description);

      formCreateGroupNotifier.onSubjectNameChanged(subjectName);
      formCreateGroupNotifier.onSubjectDescription(description);

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: const Alignment(-0.8, 1),
                    child: Text(
                      'Crear materia',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    label: 'Nombre de la materia',
                    textEditingController: subjectNameController,
                    onChanged: formCreateGroupNotifier.onUpdateSubjNameChanged,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    label: 'Descripción',
                    textEditingController: subjectDescriptionController,
                    onChanged:
                        formCreateGroupNotifier.onUpdateSubjDescriptionChanged,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    alignment: const Alignment(0.9, 2),
                    child: ButtonForm(
                      style: AppTheme.buttonPrimary,
                      buttonName: "Modificar",
                      onPressed: () async {
                        // formCreateGroupNotifier.onSubjectSubmit();
                        formCreateGroupNotifier.onUpdateIndexSubjChanged(index);
                        formCreateGroupNotifier.onUpdateSubjectsSubmit();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: () {
        showUpdateSubjectForm(subjectName, description);
      },
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 4,
        margin: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 300,
          height: MediaQuery.of(context).size.height * 0.60,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(100, 141, 141, 141),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                child: Text(
                  subjectName,
                ),
              ),
              Text(
                description,
                softWrap: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
