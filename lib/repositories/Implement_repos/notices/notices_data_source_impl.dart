import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';
import 'package:aprende_mas/config/utils/catalog_names.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/models/notice_list/notice_model.dart';
import 'package:aprende_mas/repositories/Interface_repos/notices/notices_data_source.dart';
import 'package:aprende_mas/config/network/dio_client.dart';

class NoticesDataSourceImpl implements NoticesDataSource {
  final storageService = KeyValueStorageServiceImpl();
  final cn = CatalogNames();
  @override
  Future<List<NoticeModel>> createNotice(NoticeModel notice) async {
    try {
      const uri = "/Avisos/CrearAviso";
      final groupId = notice.groupId;
      final subjectId = notice.subjectId;
      final id = await storageService.getId();

      Map<String, dynamic> data = {
        "DocenteId": id,
        "Titulo": notice.title,
        "Descripcion": notice.description,
      };

      if (groupId != 0) {
        data['GrupoId'] = groupId;
      } else if (subjectId != 0) {
        data['MateriaId'] = subjectId;
      }

      final res = await dio.post(uri, data: data);

      if (res.statusCode == 200) {
        final response = Map<String, dynamic>.from(res.data);
        final notice = NoticeModel.jsonToEntityNotice(response);
        List<NoticeModel> lsNotice = [notice];
        return lsNotice;
      }
      return [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Future<List<NoticeModel>> getlsNotices(NoticeModel notice) async {
    try {
      const uri = "/Avisos/ConsultarAvisosCreados";
      int groupId = notice.groupId;
      int subjectId = notice.subjectId;

      Map<String, dynamic> data = {};

      if (groupId != 0) {
        data['GrupoId'] = groupId;
      } else if (subjectId != 0) {
        data['MateriaId'] = subjectId;
      }

      final res = await dio.get(uri, data: data);

      if (res.statusCode == 200) {
        final resls = List<Map<String, dynamic>>.from(res.data);
        final lsNotices = NoticeModel.jsonToEntitylsNotices(resls);
        return lsNotices;
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> deleteNotice(int notice) async {
    try {
      const uri = "/Avisos/EliminarAviso";
      final res = await dio.post(uri, queryParameters: {"avisoId": notice});
      if (res.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
