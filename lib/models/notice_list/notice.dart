class Notice {
  final String messageId;
  final String title;
  final String body;
  final String sentDate;
  // final Map<String, dynamic>? data;
  final String? data;
  final String? imageUrl;

  Notice(
      {required this.messageId,
      required this.title,
      required this.body,
      required this.sentDate,
      this.data,
      this.imageUrl});

  static List<Notice> noticeJsonToEntity(List<Map<String, Object?>> lsNotices) {
    List<Notice> ls = lsNotices.map(
      (e) {
        return Notice(
            messageId: e['MensajeId'] as String,
            title: e['Titulo'] as String,
            body: e['Descripcion'] as String,
            sentDate: e['FechaEnvio'] as String,
            data: e['Data'] as String,
            imageUrl: e['ImagenURL'] as String);
      },
    ).toList();

    return ls;
  }

  @override
  String toString() {
    return '''
      PushMessage - $messageId
      title: $title
      body: $body
      sentDate: $sentDate
      data: $data
      imageUrl: $imageUrl
    ''';
  }
}
