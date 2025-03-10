import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/agenda/event_provider.dart';
import 'package:aprende_mas/providers/agenda/form_event_provider.dart';
import 'package:aprende_mas/views/widgets/calendar/event_calendar_data_source.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class CalendarBody extends ConsumerStatefulWidget {
  const CalendarBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarBodyState();
}

class _CalendarBodyState extends ConsumerState<CalendarBody> {
  CalendarView _calendarView = CalendarView.month; // Vista predeterminada
  CalendarController calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    // Llamar al método getEvents del notifier
    Future.microtask(() => ref.read(eventProvider.notifier).getEvents());
  } 

  void getRole() async{
    // role = await kvs.getRole;
  }

  @override
  Widget build(BuildContext context) {

    // Obtener el estado global de eventos
    final eventState = ref.watch(eventProvider);

    // Crear la fuente de datos para Syncfusion desde el estado actual
    final calendarDataSource = EventCalendarDataSource(eventState.events);
    debugPrint("CalendarBody Eventos cargados: ${eventState.events}");


    return Scaffold(
      body: Column(
        children: [
          // Botones para cambiar la vista
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.day;
                      calendarController.view = _calendarView;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _calendarView == CalendarView.day
                        ? Colors.blue.shade100
                        : Colors.grey.shade200,
                  ),
                  child: const Text(
                    'Día',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.week;
                      calendarController.view = _calendarView;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _calendarView == CalendarView.week
                        ? Colors.blue.shade100
                        : Colors.grey.shade200,
                  ),
                  child: const Text(
                    'Semana',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                  ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.schedule;
                      calendarController.view = _calendarView;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _calendarView == CalendarView.schedule
                        ? Colors.blue.shade100
                        : Colors.grey.shade200,
                  ),
                  child: const Text(
                    'cronograma',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _calendarView = CalendarView.month;
                      calendarController.view = _calendarView;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _calendarView == CalendarView.month
                        ? Colors.blue.shade100
                        : Colors.grey.shade200,
                  ),
                  child: const Text(
                    'Mes',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          // Calendario
          Expanded(
            child: SfCalendar(
              cellBorderColor: Colors.transparent,
              dataSource: calendarDataSource,
              controller: calendarController,
              monthViewSettings: MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                showAgenda: true
                ),
              view: _calendarView,
              showDatePickerButton: true,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/create-event');
          print('context: $context ');
        },
        backgroundColor: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(
          Icons.add,
          color: Colors.grey.withOpacity(0.6),
        ),
      ),
    );
  }
}




