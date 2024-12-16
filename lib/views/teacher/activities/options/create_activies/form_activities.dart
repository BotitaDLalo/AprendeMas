import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activty_form_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/button_activity_form.dart';
import 'package:aprende_mas/views/inputs/custom_hour_form_field.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class FormActivities extends ConsumerWidget {
  const FormActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityForm = ref.watch(activityFormProvider);

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
                label: 'Nombre Actividad',
                onChanged: ref
                    .read(activityFormProvider.notifier)
                    .onFechaEntregaChanged,
                errorMessage: activityForm.isFormPosted
                    ? activityForm.nombre.errorMessage
                    : null),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                label: 'Descripción',
                onChanged: ref
                    .read(activityFormProvider.notifier)
                    .onDescripcionChanged,
                errorMessage: activityForm.isFormPosted
                    ? activityForm.descripcion.errorMessage
                    : null),
            SizedBox(
              height: 20,
            ),
            CustomHourFormField(
              label: 'Fecha de Entrega',
              isDateField: true, // Habilita el selector de fecha
              hint: 'Selecciona la fecha',
              errorMessage: activityForm.fechaLimite.errorMessage,
              onChanged:
                  ref.read(activityFormProvider.notifier).onFechaEntregaChanged,
            ),
            SizedBox(
              height: 20,
            ),
            CustomHourFormField(
              label: 'Hora de Entrega',
              isTimeField: true, // Activa el selector de hora
              hint: 'Selecciona la hora',
              errorMessage: activityForm.horaLimite.errorMessage,
              onChanged:
                  ref.read(activityFormProvider.notifier).onHoraEntregaChanged,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ButtonActivityForm(
                  buttonName: 'Crear actividad',
                  onPressed: () {
                    ref.read(activityFormProvider.notifier).onFormSubmit();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}