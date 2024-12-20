import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/student/student.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/models/models.dart';

class StudentHomeScreen extends ConsumerStatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentHomeScreenState();
}

class _StudentHomeScreenState extends ConsumerState<StudentHomeScreen> {
  static List<BottomNavigationBarItem> lsBarItems =
      CatalogButtonNavigationBarItems.lsBarItems;

  List<WidgetOptions> lsWidgetsOptions = [
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[0],
        widget: const AgendaStudentScreen()),
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[1],
        widget: const SubjectsStudentScreen()),
    WidgetOptions(
        bottomNavigationBarItem: lsBarItems[2],
        widget: const NoticesStudentScreen())
  ];

  @override
  Widget build(BuildContext context) {
    return HomeScreen(lsWidgetsOptions: lsWidgetsOptions);
  }
}
