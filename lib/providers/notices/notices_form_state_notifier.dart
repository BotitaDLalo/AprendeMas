import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/notices_form_state.dart';
import 'package:aprende_mas/views/views.dart';
import 'package:aprende_mas/models/models.dart';

class NoticesFormStateNotifier extends StateNotifier<NoticesFormState> {
  final Future<bool> Function(NoticeModel) createNoticeCallback;
  final Future<bool> Function(int) deleteNoticeCallback;
  // final Function(NoticeModel) getNoticesCallback;

  NoticesFormStateNotifier(
      {required this.createNoticeCallback, required this.deleteNoticeCallback
      // required this.getNoticesCallback
      })
      : super(NoticesFormState());

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
    resetStates();
  }

  _touchEveryField() {
    final title = GenericInput.dirty(state.title.value);
    final description = GenericInput.dirty(state.description.value);

    state = state.copyWith(
        title: title,
        description: description,
        isValid: Formz.validate([title, description]));
  }

  onDeleteSubmit(int noticeId) async {
    state = state.copyWith(isPosting: true);
    bool noticeDeleted = await deleteNoticeCallback(noticeId);
    if (noticeDeleted) {
      state = state.copyWith(isDeleted: noticeDeleted);
    }
    state = state.copyWith(isPosting: false);
    resetStates();
  }

  resetStates() {
    //$ restablece estados
    state = state.copyWith(isFormPosted: false);
    state = state.copyWith(isDeleted: false);
  }
}
