import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/notices_form_state.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/models/models.dart';

class NoticesFormStateNotifier extends StateNotifier<NoticesFormState> {
  final Future<bool> Function(NoticeModel) createNoticeCallback;
  // final Function(NoticeModel) getNoticesCallback;

  NoticesFormStateNotifier({
    required this.createNoticeCallback,
    // required this.getNoticesCallback
  }) : super(NoticesFormState());

  onTitleChanged(String value) {
    final newTitle = GenericInput.dirty(value);
    state = state.copyWith(
        title: newTitle,
        isValid: Formz.validate([newTitle, state.description]));
  }

  onDescriptionChanged(String value) {
    final newDescription = GenericInput.dirty(value);
    state = state.copyWith(
        description: newDescription,
        isValid: Formz.validate([newDescription, state.title]));
  }

  onFormSubmit(NoticeModel createNotice) async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(isPosting: true);
    createNotice = createNotice.copyWith(
        title: state.title.value, description: state.description.value);
    bool createdNotice = await createNoticeCallback(createNotice);
    if (createdNotice) {
      state = state.copyWith(isFormPosted: createdNotice);
    }
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final title = GenericInput.dirty(state.title.value);
    final description = GenericInput.dirty(state.description.value);

    state = state.copyWith(
        title: title,
        description: description,
        isValid: Formz.validate([title, description]));
  }
}
