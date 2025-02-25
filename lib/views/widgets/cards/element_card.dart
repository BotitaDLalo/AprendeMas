import 'package:aprende_mas/config/utils/packages.dart';

class ElementCard extends ConsumerWidget {
  final String answer;
  final int score;
  final int grade;
  const ElementCard(
      {super.key,
      required this.grade,
      required this.answer,
      required this.score});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Respuesta",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(10, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(grade == -1 ? 'Sin calificar' : "$grade/$score",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
    );
  }
}
