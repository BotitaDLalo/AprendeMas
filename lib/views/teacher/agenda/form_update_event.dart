import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/form_event_provider.dart';
import 'package:aprende_mas/views/teacher/agenda/button_event_form.dart';
import 'package:aprende_mas/views/teacher/agenda/update_dropdown.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_time_form_field.dart';
import 'package:intl/intl.dart';

class FormUpdateEvents extends ConsumerStatefulWidget {
  final int eventId;
  final int teacherId;
  final String title;
  final String description;
  final String color;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> groupIds;
  final List<String> subjectIds;

  const FormUpdateEvents(
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
  ConsumerState<ConsumerStatefulWidget> createState() => _FormUpdateEventsState();
}

class _FormUpdateEventsState extends ConsumerState<FormUpdateEvents> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    final formUpdateEvent = ref.watch(formEventProvider);
    final formUpdateEventNotifier = ref.read(formEventProvider.notifier);


    String _formatTimeOfDay(TimeOfDay time) {
        final now = DateTime.now();
        final dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
        return DateFormat('hh:mm').format(dateTime); // Formato de 12 horas con AM/PM
    }


    void goRouterPop() {
      context.pop();
    }

    ref.listen(formEventProvider, (previous, next) {
        if (next.isFormPosted) {
          goRouterPop();
        }
      });

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(children: [
          CustomTextFormField(
            enableLineBreak: true,
            capitalizeFirstLetter: true,
            label: 'Titulo',
            initialValue: _titleController.value.text,
            onChanged: formUpdateEventNotifier.onUpdateTitleChanged
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            capitalizeFirstLetter: true,
            label: 'Descripción',
            initialValue: _descriptionController.text,
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
                initialValue: DateFormat('yyyy-MM-dd').format(widget.startDate), // Usar el valor inicial
                onChanged: formUpdateEventNotifier.onUpdateStartDateChanged,
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: _formatTimeOfDay(TimeOfDay.fromDateTime(widget.startDate)),
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
                initialValue: DateFormat('yyyy-MM-dd').format(widget.endDate),
                onChanged: formUpdateEventNotifier.onUpdateEndDateChanged,
              ),
              const SizedBox(width: 20),
              CustomTimeFormField(
                label: 'Hora',
                isTimeField: true,
                hint: 'Hora',
                width: 150,
                initialValue: _formatTimeOfDay(TimeOfDay.fromDateTime(widget.endDate)),
                onChanged: formUpdateEventNotifier.onUpdateEndTimeChanged,
              ),
            ],
          ),
          const SizedBox(height: 20),
          UpdateDropdownForm(
            isGroup: widget.groupIds.isNotEmpty, // Determina si es grupo o materia
            initialItemId: widget.groupIds.isNotEmpty 
                ? int.tryParse(widget.groupIds.first) 
                : int.tryParse(widget.subjectIds.first), // Pasa el ID correcto
          ),
          const SizedBox(height: 30),
          ButtonEventForm(
            buttonName: 'Actualizar',
            onPressed: () async {
              goRouterPop();
            },
          ),
        ]),
      ),
    );
  }
}
