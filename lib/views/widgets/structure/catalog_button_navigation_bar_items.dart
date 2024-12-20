import 'package:aprende_mas/config/utils/packages.dart';

class CatalogButtonNavigationBarItems {
  static List<BottomNavigationBarItem> lsBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_outlined),
      label: 'Agenda',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.school_outlined),
      label: 'Materias',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.notifications),
      label: 'Notificaciones',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.app_shortcut_outlined),
      label: 'Chat',
    ),
  ];
}
