// import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/agenda/button_event_form.dart';
import 'package:aprende_mas/views/teacher/agenda/option_dropdown.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';

class FormEvents extends ConsumerStatefulWidget {
  const FormEvents({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormEventsState();
}

class _FormEventsState extends ConsumerState<FormEvents> {

  // Future<void> showColorDialog() async {
  //     showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: const Text('Escoge un color'),
  //         content: SingleChildScrollView(
  //           child: BlockPicker(
  //             availableColors: AppTheme.availableColors,
  //             pickerColor: formCreateGroup.pickerColor,
  //             onColorChanged: (color) {
  //               formCreateGroupNotifier.onColorCodeChanged(color);
  //             },
  //           ),
  //         ),
  //         actions: <Widget>[
  //           ElevatedButton(
  //             child: const Text('Hecho'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       ),
  //     );
  //   }


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
              capitalizeFirstLetter: true,
              label: 'Titulo',
            ),
            const SizedBox(height: 20,),
            CustomTextFormField(
              capitalizeFirstLetter: true,
              label: 'Descripción',
            ),
            const SizedBox(height: 20,),
            Text('Inicia', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              children: [
                CustomTimeFormField(
                  label: 'Fecha',
                  isDateField: true,
                  hint: 'Fecha',
                  width: 150,
                ),
                const SizedBox(width: 20,),
                CustomTimeFormField(
                  label: 'Hora',
                  isTimeField: true,
                  hint: 'Hora',
                  width: 150,
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Text('Termina', style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Row(
              children: [
                CustomTimeFormField(
                  label: 'Fecha',
                  isDateField: true,
                  hint: 'Fecha',
                  width: 150,
                ),
                const SizedBox(width: 20,),
                CustomTimeFormField(
                  label: 'Hora',
                  isTimeField: true,
                  hint: 'Hora',
                  width: 150,
                ),
              ],
            ), 
            const SizedBox(height: 20,),
            OptionDropdownForm(),

            SizedBox(height: 30,),
            ButtonEventForm(buttonName: 'Crear evento', onPressed: () {})
          ]
        ),
      ),
    );
  }
}
