import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/utils.dart';
import 'package:aprende_mas/providers/providers.dart';

final roleProvider = StateProvider<String?>((ref) => null);

class RoleDropdown extends ConsumerStatefulWidget {
  const RoleDropdown({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RoleDropdownState();
}

class _RoleDropdownState extends ConsumerState<RoleDropdown> {
  @override
  Widget build(BuildContext context) {
    final cn = ref.watch(catalogNamesProvider);
    final List<String> users = [cn.getRoleStudentName, cn.getRoleTeacherName];
    final selectedValue = ref.watch(roleProvider);
    final missingDataNotifier = ref.read(missingDataFormProvider.notifier);

    ref.listen(
      missingDataFormProvider,
      (previous, next) {
        if (previous?.role != next.role) {
          missingDataNotifier.onRoleChanged(selectedValue ?? "");
        }
      },
    );

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(96, 70, 70, 70),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(1.5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: const Row(
                children: [
                  Text(
                    "Rol",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              isExpanded: true,
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              dropdownColor: Colors.white,
              value: selectedValue,
              items: users.map((user) {
                return DropdownMenuItem<String>(
                  value: user,
                  child: Text(
                    user,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                ref.read(roleProvider.notifier).state = value;
              },
            ),
          ),
        ),
      ),
    );
  }

}
