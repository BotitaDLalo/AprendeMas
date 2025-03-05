import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/users/authentication/form_missing_data.dart';

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
        body: const Center(
          child: SingleChildScrollView(
            // physics: ClampingScrollPhysics(),
            child: Column(
              children: [FormMissingData()],
            ),
          ),
        ),
      ),
    );
  }
}
