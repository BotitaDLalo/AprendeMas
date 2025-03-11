import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/agenda/event_model.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/views/widgets/calendar/event_calendar_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarBody extends ConsumerStatefulWidget {
  const CalendarBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends ConsumerState<CalendarBody> {
  CalendarView calendarView = CalendarView.month; // Vista predeterminada
  CalendarController calendarController = CalendarController();
   late EventCalendarDataSource calendarDataSource;

  final cn = CatalogNames();
  final kvs = KeyValueStorageServiceImpl();
  late String role = "";

  @override
  void initState() {
    super.initState();
    calendarDataSource = EventCalendarDataSource([]);
    getRole();
    Future.microtask(() {
      final events = ref.watch(eventProvider).events;
      calendarDataSource.updateEvents(events);
      ref.read(eventProvider.notifier).getEvents();
    });
  }

  Future<void> getRole() async {
    final userRole = await kvs.getRole();
    setState(() {
      role = userRole;
    });
  }

  void getRole() async{
    // role = await kvs.getRole;
  }

  @override
  Widget build(BuildContext context) {

    // Obtener el estado global de eventos
    final eventState = ref.watch(eventProvider);

    ref.listen(eventProvider, (previous, next) {
    calendarDataSource.updateEvents(next.events);
  });

  //   ref.listen(eventProvider, (previous, next) {
  //   setState(() {  // 🔹 Forzamos la reconstrucción de la UI
  //     calendarDataSource.updateEvents(next.events);
  //   });
  // });
    debugPrint("CalendarBody Eventos cargados: ${eventState.events}");

    return Scaffold(
    body: Column(
      children: [
        Expanded(
          child: SfCalendar(
            cellBorderColor: Colors.transparent,
            dataSource: calendarDataSource,
            controller: calendarController,
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
              showAgenda: true,
            ),
            view: calendarView,
            showDatePickerButton: true,
            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.appointment &&
                  details.appointments != null) {
                final Event selectedEvent = details.appointments!.first as Event;
                context.push('/event-detail', extra: selectedEvent);
              }
            },
          ),
        ),
      ],
    ),
    floatingActionButton: role == cn.getRoleTeacherName
          ? FloatingActionButton(
              onPressed: () async {
                await context.push('/create-event');
                ref.read(eventProvider.notifier).getEvents();
              },
              backgroundColor: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.add,
                color: Colors.grey.withOpacity(0.5),
              ),
            )
          : null, // No muestra el botón si no es docente
  );
}
}




  