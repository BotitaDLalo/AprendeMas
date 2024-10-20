import 'package:flutter/material.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const CustomNavbar({
    super.key, 
    required this.selectedIndex, 
    required this.onItemSelected
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.red,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      items: const <BottomNavigationBarItem>[
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
      ],
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
    );
  }
}
