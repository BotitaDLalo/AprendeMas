import 'package:aprende_mas/config/utils/packages.dart';

class WidgetOptions {
  final BottomNavigationBarItem bottomNavigationBarItem;
  final Widget widget;
  final String title;

  WidgetOptions(
      {required this.bottomNavigationBarItem,
      required this.widget,
      required this.title});
}
