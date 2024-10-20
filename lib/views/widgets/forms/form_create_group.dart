import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/groups/form_groups_provider.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:go_router/go_router.dart';

class FormCreateGroup extends ConsumerWidget {
  const FormCreateGroup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formCreateGroup = ref.watch(formGroupsProvider);
    final formCreateGroupNotifier = ref.read(formGroupsProvider.notifier);

    Future<void> showColorDialog() async {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Escoge un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              // availableColors: [Color(0xff8bc34a)],
              pickerColor: formCreateGroup.pickerColor,
              onColorChanged: (color) {
                formCreateGroupNotifier.onColorCodeChanged(color);
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.8, 1),
            child: Text(
              'Crear grupo',
              style: Theme.of(context).textTheme.bodyMedium,
              // style: TextStyle(color: formCreateGroup.pickerColor),
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Nombre del grupo',
            onChanged: formCreateGroupNotifier.onGroupNameChanged,
            errorMessage: formCreateGroup.isFormPosted
                ? formCreateGroup.groupName.errorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Descripción',
            onChanged: formCreateGroupNotifier.onDescriptionChanged,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: formCreateGroup.pickerColor,
                    border: Border.all(
                      color: formCreateGroup.pickerColor ==
                              const Color.fromARGB(0, 255, 255, 255)
                          ? const Color.fromARGB(100, 0, 0, 0)
                          : formCreateGroup.pickerColor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: formCreateGroup.pickerColor,
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
          const SizedBox(height: 50),
          Container(
            alignment: const Alignment(0.9, 2),
            child: ButtonForm(
                style: AppTheme.buttonPrimary,
                buttonName: "Crear grupo",
                onPressed: () async {
                  await formCreateGroupNotifier.onFormSubmit();
                  regresar();
                }),
          )
        ],
      ),
    );
  }
}
