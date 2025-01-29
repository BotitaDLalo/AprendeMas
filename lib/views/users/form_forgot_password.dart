import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/providers/providers.dart';
class FormForgotPassword extends ConsumerWidget {
  const FormForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPassword = ref.watch(forgotPasswordFormProvider);
    final forgotPasswordNotifier =
        ref.read(forgotPasswordFormProvider.notifier);

    returnLogin() {
      context.pop();
    }

    return Container(
      width: MediaQuery.of(context).size.width * 1.90,
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.8, 1),
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: 'Correo',
            textEditingController: forgotPasswordNotifier.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: forgotPasswordNotifier.onEmailChanged,
            errorMessage: forgotPassword.isFormPosted
                ? forgotPassword.email.errorMessage
                : null,
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonForm(
            style: AppTheme.buttonPrimary,
              buttonName: "Enviar",
              onPressed: () async {
                final bool? result =
                    await forgotPasswordNotifier.onFormSubmit();
                if (result == true) {
                  returnLogin();
                } else {
                  return;
                }
              })
        ],
      ),
    );
  }
}
