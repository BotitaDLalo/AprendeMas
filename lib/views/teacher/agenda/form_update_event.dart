import 'package:aprende_mas/config/utils/general_utils.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/providers/agenda/form_update_event_provider.dart';
import 'package:aprende_mas/views/teacher/agenda/button_event_form.dart';
import 'package:aprende_mas/views/teacher/agenda/update_dropdown.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_input_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';

class FormUpdateEvent extends ConsumerWidget {
  final Event event;

  const FormUpdateEvent(this.event, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formUpdateEvent = ref.watch(formUpdateEventProvider(event));
    final formUpdateEventNotifier =
        ref.read(formUpdateEventProvider(event).notifier);

    void goRouterPop() {
      context.go("/agenda-teacher");
    }

    ref.listen(formUpdateEventProvider(event), (previous, next) {
      if (next.isFormPosted && !next.isPosting) {
        goRouterPop();
        ref.read(eventProvider.notifier).getEvents();
      }
    });

    debugPrint("FormUpdateEvent");
    debugPrint("idgrupo: ${event.groupIds}");
    debugPrint("idmateria: ${event.subjectIds}");
    debugPrint("id profesor: ${event.teacherId}");
    print("Color inicial del evento en FormUpdateEvent: ${event.color}");


    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(children: [
          CustomInputField(
            enableLineBreak: true,
            capitalizeFirstLetter: true,
            label: 'Titulo',
            initialValue: formUpdateEvent.title.value,
            onChanged: formUpdateEventNotifier.onUpdateTitleChanged,
          ),
          const SizedBox(height: 20),
          CustomInputField(
            capitalizeFirstLetter: true,
            label: 'Descripción',
            initialValue: formUpdateEvent.description.value,
            onChanged: formUpdateEventNotifier.onUpdateDescriptionChanged,
          ),
          const SizedBox(height: 20),
          const Text('Inicia', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomTimeFormField(
                label: 'Fecha',
                isDateField: true,
                hint: 'Fecha',
                width: 150,
                initialValue: formatOnlyDate(event.startDate),
                onChanged: formUpdateEventNotifier.onUpdateStartDateChanged,
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: formatOnlyTime(event.startDate),
                onChanged: formUpdateEventNotifier.onUpdateStartTimeChanged,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text('Termina', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              CustomTimeFormField(
                label: 'Fecha',
                isDateField: true,
                hint: 'Fecha',
                width: 150,
                initialValue: formatOnlyDate(event.endDate),
                onChanged: formUpdateEventNotifier.onUpdateEndDateChanged,
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: formatOnlyTime(event.endDate),
                onChanged: formUpdateEventNotifier.onUpdateEndTimeChanged,
              ),
            ],
          ),
          const SizedBox(height: 20),
          UpdateDropdownForm(
            event: event,
            isGroup: (event.groupIds != null &&
                event.groupIds!.isNotEmpty), // Convertimos a bool
            initialItemId: event.groupIds != null && event.groupIds!.isNotEmpty
                ? event.groupIds!.first // Si hay grupo, toma el primer ID
                : (event.subjectIds != null && event.subjectIds!.isNotEmpty
                    ? event.subjectIds!
                        .first // Si no hay grupo, toma el primer ID de materia
                    : null), // Si no hay nada, envía null
          ),
          const SizedBox(height: 30),
          ButtonEventForm(
            buttonName: 'Actualizar',
            onPressed: () async {

              if (!ref.watch(formUpdateEventProvider(event)).isPosting) {
                await formUpdateEventNotifier.onUpdateFormSubmit(
                  event.eventId!,
                  event.teacherId,
                );
                print("color: ${event.color}");
              goRouterPop();

              }
              // goRouterPop();
            },
          ),
        ]),
      ),
    );
  }
}
