import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';

class FormLogin extends ConsumerWidget {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginFormStateNotifierProvider);
    final loginNotifier = ref.read(loginFormStateNotifierProvider.notifier);

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Correo',
              onChanged: (value) {
                loginNotifier.writeEmail(value);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Contraseña',
              onChanged: (value) {
                loginNotifier.writePassword(value);
              },
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
