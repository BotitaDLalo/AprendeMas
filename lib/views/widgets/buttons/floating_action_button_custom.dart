import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';


class FloatingActionButtonCustom extends ConsumerWidget {
  final Function()? voidCallback;
  final IconData icon;
  const FloatingActionButtonCustom(
      {super.key, required this.voidCallback, required this.icon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return FloatingActionButton(
      onPressed: voidCallback,
      backgroundColor: AppTheme.mainColor,
      shape: AppTheme.shapeFloatingActionButton(),
      child: Icon(
        icon,
        color: Colors.white,
        // size: 35,
      ),
    );
  }
}
