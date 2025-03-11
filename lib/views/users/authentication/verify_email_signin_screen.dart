import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/form_email_provider.dart';
import 'package:aprende_mas/views/users/authentication/verify_email_signin_form.dart';

class VerifyEmailSigninScreen extends ConsumerWidget {
  const VerifyEmailSigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formEmailNotifier = ref.read(formEmailProvider.notifier);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    context.pop();
                    formEmailNotifier.clearEmailSigninState();

                  },
                  icon: const Icon(Icons.arrow_back)),
            ),
            body: const SingleChildScrollView(
              // physics: CarouselScrollPhysics(),
              child: Column(
                children: [VerifyEmailSigninForm()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
