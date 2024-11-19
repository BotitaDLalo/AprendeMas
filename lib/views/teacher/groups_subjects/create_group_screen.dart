import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/views/teacher/groups_subjects/form_create_group.dart';
import 'package:go_router/go_router.dart';

class CreateGroupScreen extends ConsumerWidget {
  const CreateGroupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          // backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: AppTheme.degradedBlue),
          ),
          leading: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                context.pop();
              },
              icon: const Icon(Icons.arrow_back ,color: Colors.white,)),
        ),
        body: const Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: FormCreateGroup(),
          ),
        ),
      ),

      //TODO: PROBABLEMENTE COLOCAR AQUI EL SCROLL (VERTICAL O HORIZONTAL) PARA LA CREACION DE UNA MATERIA
    );
  }
}
