import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_provider.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';
import 'package:aprende_mas/views/widgets/inputs/custom_text_form_field.dart';
import 'package:aprende_mas/views/widgets/inputs/role_dropdown.dart';
import 'package:aprende_mas/providers/providers.dart';

class FormMissingData extends ConsumerStatefulWidget {
  const FormMissingData({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FormMissingDataState();
}

class _FormMissingDataState extends ConsumerState<FormMissingData> {
  @override
  Widget build(BuildContext context) {
    final missingDataNotifier = ref.read(missingDataFormProvider.notifier);

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
              'Datos faltantes',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: "Nombres",
            onChanged: missingDataNotifier.onUsernameChanged,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: "Apellido Paterno",
            onChanged: missingDataNotifier.onLastNameChanged,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomTextFormField(
            label: "Apellido Materno",
            onChanged: missingDataNotifier.onSecondLastNameChanged,
          ),
          const SizedBox(
            height: 15,
          ),
          const RoleDropdown(),
          const SizedBox(
            height: 15,
          ),
          Container(
              alignment: const Alignment(0.9, 2),
              child: ButtonForm(
                  style: AppTheme.buttonPrimary,
                  buttonName: "Continuar",
                  onPressed: () {
                    missingDataNotifier.onFormSubmit();
                  }))
        ],
      ),
    );
  }
}
