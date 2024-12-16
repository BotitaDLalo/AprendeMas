import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_provider.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/inputs/role_dropdown.dart';
import 'package:go_router/go_router.dart';

class FormSingin extends ConsumerWidget {
  const FormSingin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final siginForm = ref.watch(siginFormProvider);
    final siginFormNotifier = ref.read(siginFormProvider.notifier);

    void returnToLogin() {
      context.go('/login-user');
    }

    return Container(
      width: 350,
      height: MediaQuery.of(context).size.height * 0.60,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            alignment: const Alignment(-0.8, 1),
            child: Text(
              'Registrate',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: "Nombre",
            onChanged: siginFormNotifier.onNameChanged,
            errorMessage:
                siginForm.isFormPosted ? siginForm.name.errorMessage : null,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Correo',
            keyboardType: TextInputType.emailAddress,
            onChanged: siginFormNotifier.onEmailChanged,
            errorMessage:
                siginForm.isFormPosted ? siginForm.email.errorMessage : null,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onChanged: siginFormNotifier.onPasswordChanged,
            errorMessage:
                siginForm.isFormPosted ? siginForm.password.errorMessage : null,
          ),
          const SizedBox(
            height: 10,
          ),
          const RoleDropdown(),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: const Alignment(0.9, 2),
              child: ButtonForm(
                style: AppTheme.buttonPrimary,
                  buttonName: "Registrate",
                  onPressed: () async {
                    await siginFormNotifier.onFormSubmit();
                    returnToLogin();

                    // final result = await siginFormNotifier.onFormSubmit();
                    // if (result != null) {
                    //   returnToLogin();
                    // } else {
                    //   return;
                    // }
                  })),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
