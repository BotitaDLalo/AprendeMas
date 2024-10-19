import 'package:aprende_mas/config/utils/packages.dart';
import 'custom_container_style.dart';

class ContainerSubjectName extends StatelessWidget {
  final String subject;
  final String codeAccess;

  const ContainerSubjectName({
    super.key,
    required this.subject,
    required this.codeAccess,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerStyle(
      height: 90,
      width: double.infinity,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
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
                      codeAccess,
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
                  width: 20, // Espacio antes y después del divider
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white, size: 40,) )
              ],
            )
          ],
        ),
      ),
    );
  }
}