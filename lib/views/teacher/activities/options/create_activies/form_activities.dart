import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity_state/activty_form_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/button_activity_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class FormActivities extends ConsumerWidget {
  final int subjectId;
  final String nombreMateria;
  const FormActivities(
      {super.key, required this.subjectId, required this.nombreMateria});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activityForm = ref.watch(activityFormProvider);
      debugPrint('FormActivities subjectId from: ${subjectId}');

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
                label: 'Nombre Actividad',
                onChanged:
                    ref.read(activityFormProvider.notifier).onNombreChanged,
                errorMessage: activityForm.isFormPosted
                    ? activityForm.nombre.errorMessage
                    : null),
            const SizedBox(
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
            const SizedBox(
              height: 20,
            ),
            CustomTimeFormField(
              label: 'Fecha de Entrega',
              isDateField: true, // Habilita el selector de fecha
              hint: 'Selecciona la fecha',
              errorMessage: activityForm.fechaLimite.errorMessage,
              onChanged: (value) {
                final dateTime = DateTime.tryParse(value);
                if (dateTime != null) {
                  ref
                      .read(activityFormProvider.notifier)
                      .onFechaLimiteChanged(dateTime);
                } else {
                  print("Formato de fecha inválido: $value");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTimeFormField(
              label: 'Hora de Entrega',
              isTimeField: true, // Activa el selector de hora
              hint: 'Selecciona la hora',
              errorMessage: activityForm.horaLimite.errorMessage,
              onChanged: (value) {
                final timeParts = value.split(':');
                if (timeParts.length == 2) {
                  final now = DateTime.now();
                  final dateTime = DateTime(
                    now.year,
                    now.month,
                    now.day,
                    int.tryParse(timeParts[0]) ?? 0,
                    int.tryParse(timeParts[1]) ?? 0,
                  );
                  ref
                      .read(activityFormProvider.notifier)
                      .onHoraLimiteChanged(dateTime);
                } else {
                  print("Formato de hora inválido: $value");
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ButtonActivityForm(
                  buttonName: 'Crear actividad',
                  onPressed: () {
                    ref.read(activityFormProvider.notifier).onFormSubmit(subjectId);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
