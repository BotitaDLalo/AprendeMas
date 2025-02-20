import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/providers/notices/notices_form_state.dart';
import 'package:aprende_mas/providers/notices/notices_form_state_notifier.dart';
import 'package:aprende_mas/providers/notices/notices_provider.dart';

final noticesFormProvider =
    StateNotifierProvider.autoDispose<NoticesFormStateNotifier, NoticesFormState>(
  (ref) {
    final createNoticeCallback =
        ref.read(noticesProvider.notifier).createNotice;
    // final getNoticesCallback = ref.read(noticesProvider.notifier).getlsNotices;

    return NoticesFormStateNotifier(
        createNoticeCallback: createNoticeCallback,
        // getNoticesCallback: getNoticesCallback
        
        );
  },
);
