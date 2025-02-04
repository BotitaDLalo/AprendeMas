import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/form_missing_data.dart';

class MissingDataScreen extends StatelessWidget {
  const MissingDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', width: 150),
                const SizedBox(
                  height: 40,
                ),
                const FormMissingData()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
