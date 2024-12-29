import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/db_local_notices_repository.dart';

class NoticesStateNotifier extends StateNotifier<List<Notice>> {
  final DbLocalNoticesRepository dbLocalNoticesRepository;
  NoticesStateNotifier({required this.dbLocalNoticesRepository}) : super([]);

  onNewNotice(Notice notice) async {
    final noticeInserted =
        await dbLocalNoticesRepository.storeNotification(notice);
    if (noticeInserted) {
      _setNewNotice(notice);
    }
  }

  _setNewNotice(Notice notice) {
    List<Notice> lsNotices = List.from(state);
    state = [notice, ...lsNotices];
  }

  getLsNotices() async {
    final lsNotices = await dbLocalNoticesRepository.getLsNotifications();
    _setLsNotices(lsNotices);
  }

  _setLsNotices(List<Notice> lsNotices) {
    state = lsNotices;
  }

  clearNotifications() async {
    state = [];
  }

  deleteNotification(String sentDate) async {
    final deletedNotice =
        await dbLocalNoticesRepository.deleteNotification(sentDate);
    if (deletedNotice) {
      _setDeleteNotification(sentDate);
    }
  }

  _setDeleteNotification(String sentDate) {
    List<Notice> lsNotices = List.from(state);
    lsNotices.removeWhere((element) => element.sentDate == sentDate);
    state = [...lsNotices];
  }
}
