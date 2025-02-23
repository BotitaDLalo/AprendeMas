import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_provider.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/role_dropdown_sigin.dart';

class FormSingin extends ConsumerWidget {
  const FormSingin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final siginForm = ref.watch(siginFormProvider);
    final siginFormNotifier = ref.read(siginFormProvider.notifier);

    ref.listen(
      siginFormProvider,
      (previous, next) {
        if (next.isFormPosted) {
          context.go('/login-user');
        }
      },
    );

    return Container(
      width: MediaQuery.of(context).size.width * 1.90,
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
            label: "Nombres",
            onChanged: siginFormNotifier.onNameChanged,
            errorMessage:
                siginForm.isFormPosted ? siginForm.name.errorMessage : null,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  label: "Apellido Paterno",
                  onChanged: siginFormNotifier.onLastNameChanged,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CustomTextFormField(
                  label: "Apellido Materno",
                  onChanged: siginFormNotifier.onSecondLastNameChanged,
                ),
              ),
            ],
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
          const RoleDropdownSigin(),
          const SizedBox(
            height: 10,
          ),
          Container(
              alignment: const Alignment(0.9, 2),
              child: ButtonForm(
                  style: AppTheme.buttonPrimary,
                  buttonName: "Registrate",
                  onPressed: () {
                    if (siginForm.isPosting) {
                      return;
                    }
                    siginFormNotifier.onFormSubmit();
                  })),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
