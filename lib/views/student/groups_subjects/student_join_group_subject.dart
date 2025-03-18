import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/group_subjects/form_groups_subjects_provider.dart';
import 'package:aprende_mas/providers/group_subjects/groups_subjects_provider.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/views/widgets/buttons/button_login.dart';

class StudentJoinGroupSubject extends ConsumerWidget {
  const StudentJoinGroupSubject({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formCodeClass = ref.watch(formStudentJoinClassProvider);

    hideSnackBar() {
      ScaffoldMessenger.of(context).clearSnackBars();
    }

    ref.listen(
      formStudentJoinClassProvider,
      (previous, next) {
        if (next.isPosting) {
          FocusScope.of(context).unfocus();
          showLoadingScreen(context);
        }
      },
    );

    ref.listen(
      formStudentJoinClassProvider,
      (previous, next) {
        if (!next.isPosting && next.isFormPosted) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
    );

    ref.listen(
      groupsSubjectsProvider,
      (previous, next) {
        if (next.errorMessage.isNotEmpty) {
          Navigator.of(context).pop();
          hideSnackBar();
          errorMessage(context, next.errorMessage);
        }
      },
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Ingresa código de clase',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Form(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          label: 'Código',
                          onChanged: ref
                              .read(formStudentJoinClassProvider.notifier)
                              .onCodeInputChange,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
            bottomSheet: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.060,
                child: ButtonLogin(
                  text: 'Ingresar',
                  onPressed: () {
                    if (formCodeClass.isPosting) return;
                    ref
                        .read(formStudentJoinClassProvider.notifier)
                        .onFormSubmit();
                  },
                  buttonStyle: AppTheme.buttonPrimary,
                  textColor: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
