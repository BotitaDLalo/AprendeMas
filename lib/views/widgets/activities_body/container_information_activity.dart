import 'package:aprende_mas/config/utils/packages.dart';

class ContainerInformationActivity extends ConsumerWidget {
  final IconData icon;
  final String title;
  final String content;
  final GestureTapCallback? onTapFunction;
  const ContainerInformationActivity(
      {super.key,
      required this.icon,
      required this.title,
      required this.content,
      this.onTapFunction
      });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 215, 215, 215),
            border: Border.all(color: const Color.fromARGB(27, 0, 0, 0)),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 16,
                  child: Icon(icon, color: Colors.white, size: 22),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400, fontSize: 17),
                )
              ],
            ),
            Text(
              content,
              style:
                  GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25.0),
              // style: TextStyle(
              //     fontWeight: FontWeight.bold, fontSize: 25.0, ),
            ),
          ],
        ),
      ),
    );
  }
}
