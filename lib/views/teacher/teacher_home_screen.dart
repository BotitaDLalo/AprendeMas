import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/teacher.dart';
import 'package:aprende_mas/views/views.dart';

class TeacherHomeScreen extends ConsumerStatefulWidget {
  const TeacherHomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherHomeScreenState();
}

class _TeacherHomeScreenState extends ConsumerState<TeacherHomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    AgendaTeacherScreen(),
    SubjectTeacherScreen(),
    NoticesTeacherScreen(),
    ChatGeminiScreen(),
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
    BottomNavigationBarItem(
      icon: Icon(Icons.app_shortcut_outlined),
      label: 'Chat',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final auth = ref.read(authProvider);
    return Scaffold(
      appBar: const AppBarHome(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
        widgetsOptionsItems: _widgetsOptionsItems,
      ),
    );
  }
}
