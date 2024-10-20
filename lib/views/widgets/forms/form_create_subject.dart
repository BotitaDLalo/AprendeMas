import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';

import '../../../config/utils/app_theme.dart';
import '../../../providers/subjects/form_subjects_provider.dart';
import '../buttons/button_form.dart';

class FormCreateSubject extends ConsumerWidget {
  const FormCreateSubject({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formCreateSubject = ref.watch(formSubjectsProvider);
    final formCreateSubjectNotifier = ref.read(formSubjectsProvider.notifier);

    Future<void> showColorDialog() async {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Escoge un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              // availableColors: [Color(0xff8bc34a)],
              pickerColor: formCreateSubject.pickerColor,
              onColorChanged: (color) {
                formCreateSubjectNotifier.onColorCodeChanged(color);
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Hecho'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }


    void regresar() {
      context.pop();
    }

    return Container(
        width: 350,
        height: MediaQuery.of(context).size.height * 0.55,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Container(
              alignment: const Alignment(-0.8, 1),
              child: Text(
                'Crear materia',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Nombre de la materia',
              onChanged: formCreateSubjectNotifier.onSubjectNameChanged
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              label: 'Descripcion',
              onChanged: formCreateSubjectNotifier.onDescriptionChanded
            ),
            const SizedBox(
              height: 15,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: formCreateSubject.pickerColor,
                    border: Border.all(
                      color: formCreateSubject.pickerColor ==
                              const Color.fromARGB(0, 255, 255, 255)
                          ? const Color.fromARGB(100, 0, 0, 0)
                          : formCreateSubject.pickerColor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: formCreateSubject.pickerColor,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: const Offset(1, 1.5)),
                    ],
                  )),
              const SizedBox(width: 10),
              ButtonForm(
                style: AppTheme.buttonSecondary,
                buttonName: "Seleccionar Color",
                onPressed: () => showColorDialog(),
              ),
            ],
          ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  // await formCreateSubjectNotifier.onFormSubmit();
                  regresar();
                },
                child: const Text("Crear materia"))
          ],
        ));
  }
}
