import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:intl/intl.dart';


class EventDetailsScreen extends ConsumerWidget {
  final int eventId;
  final int teacherId;
  final String title;
  final String description;
  final String color;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> groupIds;
  final List<String> subjectIds;

  const EventDetailsScreen({
    super.key, 
    required this.eventId,
    required this.title,
    required this.description,
    required this.color,
    required this.startDate,
    required this.endDate,
    required this.groupIds,
    required this.subjectIds,
    required this.teacherId
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat timeFormat = DateFormat('HH:mm');
     final eventNotifier = ref.read(eventProvider.notifier);

    Future<bool?> showDeleteConfirmationDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Eliminar Evento"),
        content: const Text("¿Estás seguro de que deseas eliminar este evento?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text("Eliminar"),
          ),
        ],
      ),
    );
  }

    return Scaffold(
      appBar: AppBarScreens(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            const Divider(),
            const SizedBox(
              height: 20,
            ),

            Text('Inicia: ', style: TextStyle(fontWeight: FontWeight.bold), ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Row(
              children: [
                Text(dateFormat.format(startDate)),
                const SizedBox(width: 90,),
                Text(timeFormat.format(startDate)),
                    ],
                  ),
                ],
              ), 
            ),

            const SizedBox(height: 20,),

            Text('Finaliza: ', style: TextStyle(fontWeight: FontWeight.bold), ),
            Padding(padding: const EdgeInsets.symmetric(horizontal:  40),
              child: Column(
                children: [
            Row(
              children: [
                Text(dateFormat.format(endDate)),
                const SizedBox(width: 90,),
                Text(timeFormat.format(endDate)),
              ],
            ),
                ],
              ),
            ),

            const SizedBox(height: 20,),

            Text('Destinatario: ', style: TextStyle(fontWeight: FontWeight.bold), ),
            if (groupIds.isNotEmpty)
              Text("Grupos: ${groupIds.join(", ")}"),
            if (subjectIds.isNotEmpty)
              Text("Materias: ${subjectIds.join(", ")}"),
            if (groupIds.isEmpty && subjectIds.isEmpty)
              Text("Este evento no está asignado a ningún grupo ni materia."),

            const SizedBox(height: 20,),
            Text('Descripción: ', style: TextStyle(fontWeight: FontWeight.bold), ),
            Text(description),
            // Text(groupIds.toString() ?? subjectIds.toString()),
            // Text(subjectIds.toString())
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'updateEvent',
            onPressed: () {
                final event = Event(
                eventId: eventId,
                teacherId: teacherId,
                title: title,
                description: description,
                startDate: startDate,
                endDate: endDate,
                color: color,
                groupIds: groupIds?.map((id) => int.tryParse(id) ?? 0).toList(),  // Si es null, se mantiene null
                subjectIds: subjectIds?.map((id) => int.tryParse(id) ?? 0).toList(),  // Si es null, se mantiene null
              );


              print("Navegando a /update-event con event: $event");
              context.push('/update-event', extra: event);
            },
            child: const Icon(Icons.edit),
          ),

        const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () async{
               final confirm = await showDeleteConfirmationDialog(context);
          
               if (confirm == true) {
                try {
                  // Llamar al método deleteEvent del EventNotifier
                  await eventNotifier.deleteEvent(teacherId, eventId);
                  print("tecaherId: ${teacherId}, eventId: ${eventId} desde detalles");
          
                  // Mostrar un mensaje de éxito
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Evento eliminado correctamente")),
                  );
          
                  // Navegar de regreso a la pantalla anterior
                  Navigator.pop(context);
                } catch (e) {
                  // Mostrar un mensaje de error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Error al eliminar el evento: $e")),
                  );
                }
              }
            },
            child: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}

