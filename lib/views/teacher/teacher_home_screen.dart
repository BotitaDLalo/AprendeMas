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
        bottomNavigationBarItem: lsBarItems[0],
        widget: const AgendaTeacherScreen()),
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[1],
        widget: const GroupsSubjectsTeacherScreen()),
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[2],
        widget: const NoticesTeacherScreen()),
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[3],
        widget: const ChatGeminiScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return HomeScreen(lsWidgetsOptions: lsWidgetsOptions);
  }
}
