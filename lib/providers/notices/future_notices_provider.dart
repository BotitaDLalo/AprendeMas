import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Implement_repos/notices/notices_repository_impl.dart';

final futureNoticesProvider =
    FutureProvider.autoDispose.family<List<NoticeModel>, NoticeModel>(
  (ref, notice) async {
    final noticesRepository = NoticesRepositoryImpl();

    final lsNotices = await noticesRepository.getlsNotices(notice);

    return lsNotices;
  },
);
