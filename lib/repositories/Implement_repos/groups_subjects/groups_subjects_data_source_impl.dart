import 'package:aprende_mas/config/data/key_value_storage_service_impl.dart';
import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/utils/packages.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/groups_subjects/groups_subjects_data_source.dart';

class GroupsSubjectsDataSourceImpl implements GroupsSubjectsDataSource {
  final storageService = KeyValueStorageServiceImpl();

  @override
  Future<JoinClass> joinClass(String codeClass) async {
    try {
      const uri = "/Alumnos/UnirseAClaseM";

      final studentId = await storageService.getId();
     
      final res = await dio
          .post(uri, data: {"AlumnoId": studentId, "CodigoAcceso": codeClass});

      final resMap = Map<String, dynamic>.from(res.data);

      final response = JoinClass.resJsonToEntity(resMap);

      return response;
    } catch (e) {
      debugPrint(e.toString());
      throw UncontrolledError();
    }
  }
}
