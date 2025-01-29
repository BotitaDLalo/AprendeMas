// import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_provider.dart';
import 'package:aprende_mas/views/teacher/agenda/button_event_form.dart';
import 'package:aprende_mas/views/teacher/agenda/option_dropdown.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';

class FormEvents extends ConsumerStatefulWidget {
  const FormEvents({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormEventsState();
}

class _FormEventsState extends ConsumerState<FormEvents> {

  @override
  Widget build(BuildContext context) {
    final formCreateEvent = ref.watch(formEventProvider);
    final formCreatedEventNotifier = ref.read(formEventProvider.notifier);

    Future<void> showColorDialog() async {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Escoge un color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              availableColors: AppTheme.availableColors,
              pickerColor: formCreateEvent.pickerColor,
              onColorChanged: (color) {
                formCreatedEventNotifier.onColorCodeChanged(color);
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

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
              enableLineBreak: true,
              capitalizeFirstLetter: true,
              label: 'Titulo',
              onChanged: formCreatedEventNotifier.onTitleChanged,
            ),
            const SizedBox(height: 20,),
            CustomTextFormField(
              capitalizeFirstLetter: true,
              label: 'Descripción',
              onChanged: formCreatedEventNotifier.onDescriptionChanged,
            ),
            const SizedBox(height: 20,),
            const Text('Inicia', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              children: [
                CustomTimeFormField(
                  label: 'Fecha',
                  isDateField: true,
                  hint: 'Fecha',
                  width: 150,
                  onChanged: formCreatedEventNotifier.onStartDateChanged,
                ),
                const SizedBox(width: 20,),
                CustomTimeFormField(
                  label: 'Hora',
                  isTimeField: true,
                  hint: 'Hora',
                  width: 150,
                  onChanged: formCreatedEventNotifier.onStartTimeChanged,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Text('Termina', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              children: [
                CustomTimeFormField(
                  label: 'Fecha',
                  isDateField: true,
                  hint: 'Fecha',
                  width: 150,
                  onChanged: formCreatedEventNotifier.onEndDatechanged,
                ),
                const SizedBox(width: 20,),
                CustomTimeFormField(
                  label: 'Hora',
                  isTimeField: true,
                  hint: 'Hora',
                  width: 150,
                  onChanged: formCreatedEventNotifier.onEndTimechanged,
                ),
              ],
            ), 
            const SizedBox(height: 20,),
            OptionDropdownForm(),
            const SizedBox(height: 20,),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: formCreateEvent.pickerColor,
                    border: Border.all(
                      color: formCreateEvent.pickerColor ==
                              const Color.fromARGB(0, 255, 255, 255)
                          ? const Color.fromARGB(100, 0, 0, 0)
                          : formCreateEvent.pickerColor,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: formCreateEvent.pickerColor,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: const Offset(1, 1.5)),
                    ],
                  )),
              const SizedBox(width: 10),
              ButtonForm(
                // style: AppTheme.buttonSecondary,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: formCreateEvent.pickerColor ==
                          const Color.fromARGB(0, 255, 255, 255)
                      ? const Color.fromARGB(150, 0, 0, 0)
                      : formCreateEvent.pickerColor,
                  fixedSize: const Size.fromHeight(45),
                  // side: BorderSide(color: _colorThemes[1]),
                  side: BorderSide(
                    color: formCreateEvent.pickerColor ==
                            const Color.fromARGB(0, 255, 255, 255)
                        ? const Color.fromARGB(100, 0, 0, 0)
                        : formCreateEvent.pickerColor,
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
          const SizedBox(height: 30,),
          ButtonEventForm(buttonName: 'Crear evento', onPressed: () {})
          ]
        ),
      ),
    );
  }
}
