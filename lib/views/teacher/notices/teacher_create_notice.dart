import 'package:aprende_mas/config/utils/app_theme.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/notices/notices_form_provider.dart';
import 'package:aprende_mas/views/views.dart';

class TeacherCreateNotice extends ConsumerStatefulWidget {
  final NoticeModel notice;
  const TeacherCreateNotice({super.key, required this.notice});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TeacherCreateNoticeState();
}

class _TeacherCreateNoticeState extends ConsumerState<TeacherCreateNotice> {
  @override
  Widget build(BuildContext context) {
    final formNoticeNotifier = ref.read(noticesFormProvider.notifier);
    final formNotice = ref.watch(noticesFormProvider);
    NoticeModel notice = widget.notice;

    ref.listen(
      noticesFormProvider,
      (previous, next) {
        if (next.isFormPosted && !next.isPosting) {
          context.pop();
        }
      },
    );

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Crear aviso',
        // titleWidget: Icon(
        //   Icons.abc_rounded,
        //   color: Colors.black,
        // ),
        // leading: Icon(
        //   Icons.holiday_village,
        //   color: Colors.black,
        // ),
        onVoidCallback: () async {
          if (formNotice.isPosting) {
            return;
          }
          await formNoticeNotifier.onFormSubmit(notice);
        },
        showButtonAppBar: true,
      ),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Titulo',
              capitalizeFirstLetter: true,
              onChanged: formNoticeNotifier.onTitleChanged,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Descripción',
              capitalizeFirstLetter: true,
              enableLineBreak: true,
              onChanged: formNoticeNotifier.onDescriptionChanged,
            )
          ],
        ),
      )),
    );
  }
}

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final bool showActionIcon;
  final bool showButtonAppBar;
  final VoidCallback? onVoidCallback;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.showActionIcon = false,
      this.showButtonAppBar = false,
      this.onVoidCallback});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25 / 2.5),
      child: Stack(
        children: [
          Positioned.fill(
              child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black),
            ),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: BackButton(
                      color: Colors.black,
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
              if (showActionIcon)
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
              if (showButtonAppBar)
                Transform.translate(
                  offset: const Offset(10, 0),
                  child: InkWell(
                    child: ElevatedButton(
                        style: AppTheme.buttonPrimary,
                        onPressed: onVoidCallback,
                        child: const Text(
                          'Crear',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                  ),
                ),
            ],
          )
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
