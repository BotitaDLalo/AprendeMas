import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/models/models.dart';

class TeacherHomeScreen extends ConsumerStatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends ConsumerState<TeacherHomeScreen> {
  static List<BottomNavigationBarItem> lsBarItems =
      CatalogButtonNavigationBarItems.lsBarItems;

  List<WidgetOptions> lsWidgetsOptions = [
    WidgetOptions(
        title: 'Agenda',
        bottomNavigationBarItem: lsBarItems[0],
        widget: const AgendaTeacherScreen()),
    WidgetOptions(
        title: 'Grupos y Materias',
        bottomNavigationBarItem: lsBarItems[1],
        widget: const GroupsSubjectsTeacherScreen()),
    WidgetOptions(
        title: 'Notificaciones',
        bottomNavigationBarItem: lsBarItems[2],
        widget: const NoticesTeacherScreen()),
    WidgetOptions(
        title: 'Chat',
        bottomNavigationBarItem: lsBarItems[3],
        widget: const ChatGeminiScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return HomeScreen(lsWidgetsOptions: lsWidgetsOptions);
  }
}
