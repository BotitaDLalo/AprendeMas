import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/providers/notices/notices_state.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/notices_repository.dart';

class NoticesStateNotifier extends StateNotifier<NoticesState> {
  final NoticesRepository noticesRepository;

  NoticesStateNotifier({required this.noticesRepository})
      : super(NoticesState());

  Future<bool> createNotice(NoticeModel notice) async {
    try {
      List<NoticeModel> lsNotices =
          await noticesRepository.createNotice(notice);

      if (lsNotices.isNotEmpty) {
        _setNewNotice(notice);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  // Future<List<NoticeModel>> getlsNotices(NoticeModel notice) async {
  //   try {
  //     List<NoticeModel> lsNotices =
  //         await noticesRepository.getlsNotices(notice);

  //     _setlsNotices(lsNotices);
  //     return lsNotices;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return [];
  //   }
  // }
  // _setlsNotices(List<NoticeModel> lsNotices) {}

  _setNewNotice(NoticeModel notice) {}

}
