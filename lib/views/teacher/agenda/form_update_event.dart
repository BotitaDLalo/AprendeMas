import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_provider.dart';
import 'package:aprende_mas/providers/agenda/form_update_event_provider.dart';
import 'package:aprende_mas/views/teacher/agenda/button_event_form.dart';
import 'package:aprende_mas/views/teacher/agenda/update_dropdown.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_input_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';
import 'package:intl/intl.dart';


class FormUpdateEvent extends ConsumerWidget {
  final int eventId;
  final int teacherId;
  final String title;
  final String description;
  final String color;
  final DateTime startDate;
  final DateTime endDate;
  final List<int> groupIds;
  final List<int> subjectIds;

  const FormUpdateEvent(
    this.eventId,
    this.teacherId,
    this.title,
    this.description,
    this.color,
    this.startDate,
    this.endDate,
    this.groupIds,
    this.subjectIds,
    {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final formUpdateEvent = ref.watch(formEventProvider);
    // final formUpdateEventNotifier = ref.read(formUpdateEventProvider());
    String _formatTimeOfDay(TimeOfDay time) {
      final now = DateTime.now();
      final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat('hh:mm').format(dateTime); // Formato de 12 horas con AM/PM
    }

    void goRouterPop() {
      context.pop();
    }

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(children: [
          CustomInputField(
            enableLineBreak: true,
            capitalizeFirstLetter: true,
            label: title,
            initialValue: title,
          ),
          const SizedBox(height: 20),
          CustomInputField(
            capitalizeFirstLetter: true,
            label: description,
            initialValue: description,
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
                initialValue: DateFormat('yyyy-MM-dd').format(startDate),
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: _formatTimeOfDay(TimeOfDay.fromDateTime(startDate)),
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
                initialValue: DateFormat('yyyy-MM-dd').format(endDate),
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: _formatTimeOfDay(TimeOfDay.fromDateTime(endDate)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // UpdateDropdownForm(
          //   isGroup: widget.groupIds.isNotEmpty, // Determina si es grupo o materia
          //   initialItemId: widget.groupIds.isEmpty
          //       ? widget.groupIds
          //       : widget.subjectIds // Pasa el ID correcto
          // ),
          const SizedBox(height: 30),
          ButtonEventForm(
            buttonName: 'Actualizar',
            onPressed: () async {
              // if (!ref.read(formEventProvider).isPosting) {
              //   await formUpdateEventNotifier.onUpdateFormSubmit(
              //     eventId
              //     // widget.title, 
              //     // widget.description, 
              //     // widget.startDate, 
              //     // widget.endDate
              //   );
              // }
              goRouterPop();
            },
          ),
        ]),
      ),
    );
  }
}
