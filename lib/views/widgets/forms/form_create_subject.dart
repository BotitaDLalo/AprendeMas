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
              pickerColor: formCreateSubject.subPickerColor,
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
        // height: MediaQuery.of(context).size.height * 0.55,
        height: MediaQuery.of(context).size.height * 0.75,
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
                onChanged: formCreateSubjectNotifier.onSubjectNameChanged),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
                label: 'Descripcion',
                onChanged: formCreateSubjectNotifier.onDescriptionChanded),
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
                      color: formCreateSubject.subPickerColor,
                      border: Border.all(
                        color: formCreateSubject.subPickerColor ==
                                const Color.fromARGB(0, 255, 255, 255)
                            ? const Color.fromARGB(100, 0, 0, 0)
                            : formCreateSubject.subPickerColor,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: formCreateSubject.subPickerColor,
                            spreadRadius: 0.1,
                            blurRadius: 3,
                            offset: const Offset(1, 1.5)),
                      ],
                    )),
                const SizedBox(width: 10),
                ButtonForm(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: formCreateSubject.subPickerColor ==
                          const Color.fromARGB(0, 255, 255, 255)
                      ? const Color.fromARGB(150, 0, 0, 0)
                      : formCreateSubject.subPickerColor,
                  fixedSize: const Size.fromHeight(45),
                  // side: BorderSide(color: _colorThemes[1]),
                  side: BorderSide(
                    color: formCreateSubject.subPickerColor ==
                            const Color.fromARGB(0, 255, 255, 255)
                        ? const Color.fromARGB(100, 0, 0, 0)
                        : formCreateSubject.subPickerColor,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // border radius
                  ),
                ),
                buttonName: "Seleccionar Color",
                onPressed: () => showColorDialog(),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),          Container(
            height: 210,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromARGB(100, 0, 0, 0))
            ),
          ),
          const SizedBox(height: 15),
          Container(
            alignment: const Alignment(0.9, 2),
            child: ButtonForm(
                style: AppTheme.buttonPrimary,
                buttonName: "Crear grupo",
                onPressed: () async {
                  await formCreateSubjectNotifier.onFormSubmit();
                  regresar();
                }),
          )
          ],
        )
        
        );
  }
}
