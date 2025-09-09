import 'package:aprende_mas/models/models.dart';

class NoticesState {
  final List<NoticeModel> lsNotices;

  NoticesState({this.lsNotices = const []});

  NoticesState copyWith({List<NoticeModel>? lsNotices}) =>
      NoticesState(lsNotices: lsNotices ?? this.lsNotices);
}
