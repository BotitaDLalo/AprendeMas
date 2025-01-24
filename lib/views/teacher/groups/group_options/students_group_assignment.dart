import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/providers/providers.dart';
import 'package:aprende_mas/views/widgets/buttons/button_form.dart';

final addStudentGroupMessageProvider = StateProvider<bool>((ref) => false);
final contentGroupProvider = StateProvider<String>((ref) => '');

class StudentsGroupAssigment extends ConsumerStatefulWidget {
  final int id;
  const StudentsGroupAssigment({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentsGroupState();
}

class _StudentsGroupState extends ConsumerState<StudentsGroupAssigment> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        ref.read(contentGroupProvider.notifier).state = controller.text;
        ref.read(addStudentGroupMessageProvider.notifier).state = true;
      } else {
        ref.read(addStudentGroupMessageProvider.notifier).state = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void clear() {
      controller.clear();
      ref.read(addStudentGroupMessageProvider.notifier).state = false;
      FocusScope.of(context).unfocus();
    }

    ref.listen(
      formGroupsProvider,
      (previous, next) {
        final isValid = next.verifyEmail?.isEmailValid ?? false;
        if (isValid) {
          clear();
        }
      },
    );

    final isNotEmpty = ref.watch(addStudentGroupMessageProvider);
    final content = ref.watch(contentGroupProvider);

    final formGroups = ref.watch(formGroupsProvider);
    final formGroupsNotifier = ref.read(formGroupsProvider.notifier);

    final lsEmails = ref.watch(groupsProvider).lsEmails;
    final groupsNotifier = ref.read(groupsProvider.notifier);

    ref.listen(formGroupsProvider, (previous, next) {
      final isFormPosted = next.isFormPosted;
      if (isFormPosted) {
        // clear();
        groupsNotifier.clearLsEmails();
      }
    });
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: 350,
            height: 150,
            child: Column(
              children: [
                CustomTextFormField(
                  textEditingController: controller,
                  label: 'Agregar alumno',
                ),
                isNotEmpty
                    ? SizedBox(
                        width: 330,
                        child: Container(
                          color: Colors.grey.shade200,
                          child: ListTile(
                            onTap: () async {
                              if (formGroups.isPosting) {
                                return;
                              }
                              await formGroupsNotifier
                                  .onVerifyEmailSubmit(content);
                            },
                            title: const Text(
                              'Agregar',
                              style: TextStyle(fontSize: 16.5),
                            ),
                            subtitle: Text(
                              content,
                              style: const TextStyle(fontSize: 16.5),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.person),
                              iconSize: 30,
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
          SizedBox(
            // width: 350,
            height: 350,
            child: Column(
              children: [
                Text(
                  'Agregar alumnos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 250,
                      width: 360,
                      child: ListView.builder(
                        itemCount: lsEmails.length,
                        itemBuilder: (context, index) {
                          final email = lsEmails[index];
                          if (email.isEmailValid) {
                            return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade200,
                              ),
                              child: ListTile(
                                leading: IconButton(
                                  icon: const Icon(Icons.person),
                                  iconSize: 30,
                                  onPressed: () {},
                                ),
                                title: Text(
                                  email.email,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16.5),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    groupsNotifier.onDeleteVeryfyEmail(index);
                                  },
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    Container(
                        alignment: const Alignment(0.9, 2),
                        child: ButtonForm(
                            style: AppTheme.buttonPrimary,
                            buttonName: "Agregar",
                            onPressed: () async {
                              if (formGroups.isPosting) {
                                return;
                              }
                              formGroupsNotifier.onAddStudentsGroup(widget.id);
                              if (formGroups.isFormPosted) {
                                ref.read(groupsProvider.notifier).clearLsEmails();
                              }
                            })),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  
  }
}
