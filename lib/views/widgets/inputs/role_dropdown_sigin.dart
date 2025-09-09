import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/config/utils/utils.dart';

final roleProvider = StateProvider<String?>((ref) => null);

class RoleDropdownSigin extends ConsumerStatefulWidget {
  const RoleDropdownSigin({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RoleDropdownSiginState();
}

class _RoleDropdownSiginState extends ConsumerState<RoleDropdownSigin> {
  @override
  Widget build(BuildContext context) {
    final cn = ref.watch(catalogNamesProvider);
    final List<String> users = [cn.getRoleStudentName, cn.getRoleTeacherName];
    final selectedValue = ref.watch(roleProvider);
    final siginNotifier = ref.read(signinFormProvider.notifier);

    ref.listen(
      signinFormProvider,
      (previous, next) {
        if (previous?.role != next.role) {
          siginNotifier.onRoleChanged(selectedValue ?? "");
        }
      },
    );

    return DropdownButtonFormField(
      hint: const Row(
        children: [
          Text(
            "Rol",
            style: TextStyle(color: Colors.black, fontSize: 18),
          )
        ],
      ),
      isExpanded: true,
      items: users.map((user) {
        return DropdownMenuItem<String>(
          value: user,
          child: Text(
            user,
            style: const TextStyle(fontSize: 20),
          ),
        );
      }).toList(),
      onChanged: (value) {},
    );

    // return DropdownButtonHideUnderline(
    //   child: DropdownButton<String>(
    //     hint: const Row(
    //       children: [
    //         Text(
    //           "Rol",
    //           style: TextStyle(color: Colors.black, fontSize: 18),
    //         ),
    //       ],
    //     ),
    //     isExpanded: true,
    //     icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
    //     dropdownColor: Colors.white,
    //     value: selectedValue,
    //     items: users.map((user) {
    //       return DropdownMenuItem<String>(
    //         value: user,
    //         child: Text(
    //           user,
    //           style: const TextStyle(fontSize: 20),
    //         ),
    //       );
    //     }).toList(),
    //     onChanged: (value) {
    //       ref.read(roleProvider.notifier).state = value;
    //     },
    //   ),
    // );
  }
}
