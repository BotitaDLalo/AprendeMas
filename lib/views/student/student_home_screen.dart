import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/student/agenda/agenda_student_screen.dart';
import 'package:aprende_mas/views/student/groups_subjects/subjects_student_screen.dart';
import 'package:aprende_mas/views/student/notices/notices_student_screen.dart';
import 'package:aprende_mas/views/views.dart';

class StudentHomeScreen extends ConsumerStatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StudentHomeScreenState();
}

class _StudentHomeScreenState extends ConsumerState<StudentHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetsOptions = <Widget>[
    AgendaStudentScreen(),
    SubjectsStudentScreen(),
    NoticesStudentScreen()
    // AgendaScreen(),
    // SubjectScreen(),
    // NoticesScreen(),
    // ChatGeminiScreen(),
  ];

  static const List<BottomNavigationBarItem> _widgetsOptionsItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Agenda',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined),
      label: 'Materias',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notificaciones',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHome(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _widgetsOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
        widgetsOptionsItems: _widgetsOptionsItems,
      ),
    );
  }
}
