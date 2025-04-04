import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/users/authentication/form_missing_data.dart';

class MissingDataScreen extends ConsumerWidget {
  const MissingDataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              ref.read(authProvider.notifier).popAuth();
              context.go('/');
            },
          ),
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
