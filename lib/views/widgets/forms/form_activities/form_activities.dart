import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_date_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_hour_form_field.dart';

class FormActivities extends ConsumerStatefulWidget {
  const FormActivities({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormAtivitiesState();
}

class _FormAtivitiesState extends ConsumerState<FormActivities> {

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Nombre Actividad',
            ),
            SizedBox(height: 20,),
            CustomTextFormField(
              label: 'Descripción',
            ),
            SizedBox(height: 20,),
            CustomDateFormField(
              label: 'Fecha de Entrega',
              isDateField: true, // Habilita el selector de fecha
              hint: 'Selecciona la fecha',
            ),
            SizedBox(height: 20,),
            CustomHourFormField(
              label: 'Hora de Entrega',
              isTimeField: true, // Activa el selector de hora
              hint: 'Selecciona la hora',
            ),
            SizedBox(height: 50,),
            ButtonForm(buttonName: 'Crear', onPressed: () {})
          ],
        ),
      ),
    );
  }
}