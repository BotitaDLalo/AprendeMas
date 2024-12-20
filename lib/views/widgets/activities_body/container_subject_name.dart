import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'custom_container_style.dart';

class ContainerNameGroupSubjects extends StatelessWidget {
  final String name;
  final String accessCode;
  final String? colorCode;
  const ContainerNameGroupSubjects(
      {super.key,
      required this.name,
      required this.accessCode,
      this.colorCode});

  @override
  Widget build(BuildContext context) {
    Color color(String colorCode) {
      if (colorCode == "") {
        return AppTheme.cardHeader;
      } else {
        return AppTheme.stringToColor(colorCode);
      }
    }

    return CustomContainerStyle(
      height: 90,
      width: double.infinity,
      color: color(colorCode ?? ""),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      'Código de clase: ',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      accessCode,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const VerticalDivider(
                  color: Colors.white, // Color del divider
                  thickness: 2, // Grosor del divider
                  width: 10, // Espacio antes y después del divider
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 40,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
