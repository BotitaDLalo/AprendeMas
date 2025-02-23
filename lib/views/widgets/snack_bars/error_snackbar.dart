import 'package:aprende_mas/config/utils/packages.dart';

errorMessage(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: ClipRRect(
      borderRadius:
          BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.red, // Fondo rojo sin margen negro
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          children: [
            const Icon(Icons.error, color: Colors.white, size: 40),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Error',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    message,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent, // Elimina el fondo negro
    elevation: 0, // Elimina la sombra
  ));
}
