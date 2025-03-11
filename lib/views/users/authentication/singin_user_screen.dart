import 'package:aprende_mas/config/data/data.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/users/authentication/form_signin.dart';

class SinginUserScreen extends ConsumerWidget {
  const SinginUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storageService = KeyValueStorageServiceImpl();
    final formSigninNotifier = ref.read(signinFormProvider.notifier);

    void deleteEmaulUser() async {
      await storageService.removeEmail();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                formSigninNotifier.clearFormSigninState();
                deleteEmaulUser();
                FocusScope.of(context).unfocus();
                context.pop();
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: const SingleChildScrollView(
          child: FormSingin(),
        ),
      ),
    );
  }
}
