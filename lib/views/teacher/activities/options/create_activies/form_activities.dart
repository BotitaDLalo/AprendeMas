import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/activity/activity_provider.dart';
import 'package:aprende_mas/providers/activity/activty_form_provider.dart';
import 'package:aprende_mas/views/teacher/activities/options/create_activies/button_activity_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';
import 'package:aprende_mas/views/widgets/widgets.dart';

class FormActivities extends ConsumerStatefulWidget {
  final int subjectId;
  final String nombreMateria;

  const FormActivities({
    super.key,
    required this.subjectId,
    required this.nombreMateria,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormActivitiesState();
}

class _FormActivitiesState extends ConsumerState<FormActivities> {

  @override
  Widget build(BuildContext context) {
    final activityForm = ref.watch(activityFormProvider);
    final activityCreated = ref.read(activityFormProvider.notifier);

    void goRouterPop() {
      context.pop();
    }

    // @override
    // void initState() {
    //   super.initState();
    //   final refreshKey = StateProvider<bool>((ref) => false);
    //   // Escuchar el estado del formulario para actualizar la lista y navegar
    //   ref.listen(activityFormProvider, (previous, next) {
    //     if (next.isFormPosted) {
    //       ref.read(refreshKey.notifier).state = true; // Actualiza el estado
    //     }
    //   });
    // }

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
                capitalizeFirstLetter: true,
                textEditingController: activityCreated.nombreController,
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
              enableLineBreak: true,
              capitalizeFirstLetter: true,
              customHeight: 60,
              textEditingController: activityCreated.descripcionController,
              label: 'Descripción',
              onChanged:
                  ref.read(activityFormProvider.notifier).onDescripcionChanged,
              errorMessage: activityForm.isFormPosted
                  ? activityForm.descripcion.errorMessage
                  : null,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomTimeFormField(
                    width: 150,
                    controller: activityCreated.fechaController,
                    label: 'Fecha de Entrega',
                    isDateField: true, // Habilita el selector de fecha
                    hint: 'Fecha',
                    errorMessage: activityForm.fechaLimite.errorMessage,
                    onChanged: ref
                        .read(activityFormProvider.notifier)
                        .onFechaLimiteChanged),
                const SizedBox(
                  width: 15,
                ),
                CustomTimeFormField(
                    width: 150,
                    controller: activityCreated.horaController,
                    label: 'Hora de Entrega',
                    isTimeField: true, // Activa el selector de hora
                    hint: 'Hora',
                    errorMessage: activityForm.horaLimite.errorMessage,
                    onChanged: ref
                        .read(activityFormProvider.notifier)
                        .onHoraLimiteChanged),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
                isNumericKeyboard: true,
                textEditingController: activityCreated.puntajeController,
                label: 'Puntaje',
                onChanged:
                    ref.read(activityFormProvider.notifier).onPuntajeChanged,
                errorMessage: activityForm.isFormPosted
                    ? activityForm.puntaje.errorMessage
                    : null),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ButtonActivityForm(
                  buttonName: 'Crear actividad',
                  onPressed: () async {
                    if (!ref.read(activityFormProvider).isPosting) {
                      await activityCreated.onFormSubmit(
                          widget.subjectId, widget.nombreMateria);
                    }

                    // if(activityForm.isFormPosted) return goRouterPop();
                    ref.read(activityProvider.notifier).getAllActivities(widget.subjectId);

                    goRouterPop();

                    // final updatedState = ref.read(activityFormProvider);

                    // print("res: ${updatedState.isFormPosted}");
                    // if (updatedState.isFormPosted) {
                    //   print("res: ${updatedState.isFormPosted}");
                    //   return goRouterPop();
                    // }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
