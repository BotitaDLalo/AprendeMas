import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aprende_mas/providers/authentication/sigin_form_provider.dart';



class RoleDropdown extends ConsumerStatefulWidget {
  const RoleDropdown({super.key});

  @override
  ConsumerState<RoleDropdown> createState() => _RoleDropdownState();
}

class _RoleDropdownState extends ConsumerState<RoleDropdown> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final siginFormNotifier = ref.watch(siginFormProvider.notifier); // Acceder al notifier

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton<String>(
          value: selectedRole,
          hint: const Text(
            "Seleccione un rol",
            style: TextStyle(fontSize: 25),
          ),
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem(
              value: "Docente",
              child: Text(
                "Docente",
                style: TextStyle(fontSize: 25),
              ),
            ),
            DropdownMenuItem(
              value: "Alumno",
              child: Text(
                "Alumno",
                style: TextStyle(fontSize: 25),
              ),
            ),
          ],
          onChanged: (String? newValue) {
            setState(() {
              selectedRole = newValue;
            });
            if (newValue == "Docente") {
              siginFormNotifier.onRoleChanged(newValue.toString());
            } else if (newValue == "Alumno") {
              siginFormNotifier.onRoleChanged(newValue.toString());
            }
          },
        ),
      ],
    );
  }
}
